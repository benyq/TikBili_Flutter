import 'package:TikBili/business/common/view_state/state_view_widget.dart';
import 'package:TikBili/http/bilibili_response.dart';
import 'package:TikBili/utils/log.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin PageStateWidgetMixin on StateViewMixin{
  EasyRefreshController? _refreshController;

  @override
  VoidCallback? get retryBlock => () {
    refreshData();
  };

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior()
          .copyWith(physics: const BouncingScrollPhysics()),
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          scrollNotificationCallback(scrollNotification);
          return false;
        },
        child: EasyRefresh(
          header: const CupertinoHeader(),
            controller: refreshController,
            onRefresh: () {
              refreshData();
            },
            onLoad: () {
              loadMoreData();
            },
            child: buildPagingList(ref)),
      ),
    );
  }


  void scrollNotificationCallback(ScrollNotification scrollNotification) {}

  Widget buildPagingList(WidgetRef ref);

  EasyRefreshController? createRefreshController() {
    return null;
  }

  void refreshData() {}

  void loadMoreData() {}

  EasyRefreshController get refreshController =>
      _refreshController ??= (createRefreshController() ??
          EasyRefreshController(controlFinishRefresh: false));
}

mixin PageLogic {
  var page = 1;
  final EasyRefreshController refreshController = EasyRefreshController(
      controlFinishRefresh: true, controlFinishLoad: true);

  void sendRefreshPagingRequest<T>(
    ValueGetter<Future<BiliBiliResponse<T>>> sendRequestBlock,
    ValueChanged<T>? successBlock, {
    VoidCallback? emptyCallback,
    VoidCallback? failCallback,
  }) {
    page = 1;
    sendRequestBlock().then((result) {
      if (result.isSuccess) {
        page++;
        refreshController.finishRefresh();
        if (result.isEmpty()) {
          emptyCallback?.call();
        } else {
          successBlock?.call(result.data!);
        }
      } else {
        refreshController.finishRefresh(IndicatorResult.fail);
        Log.e('refresh fail');
        failCallback?.call();
      }
    }).catchError((e) {
      refreshController.finishRefresh(IndicatorResult.fail);
      failCallback?.call();
      Log.e('refresh error: $e');
    });
  }

  void sendLoadMorePagingRequest<T>(
    Future<BiliBiliResponse<T>> sendRequestBlock,
    ValueChanged<T>? successBlock, {
    VoidCallback? emptyCallback,
    VoidCallback? failCallback,
  }) {
    sendRequestBlock.then((result) {
      if (result.isSuccess) {
        page++;
        bool isNoMoreData = result.noMoreData();
        if (isNoMoreData) {
          refreshController.finishLoad(IndicatorResult.noMore);
          emptyCallback?.call();
        } else {
          refreshController.finishLoad();
        }
        if (successBlock != null && !result.isEmpty()) {
          successBlock(result.data!);
        }
      } else {
        refreshController.finishLoad(IndicatorResult.fail);
        failCallback;
      }
    }).catchError((e) {
      refreshController.finishLoad(IndicatorResult.fail);
      failCallback?.call();
      Log.e('refresh error: $e');
    });
  }
}
