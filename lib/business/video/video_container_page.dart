import 'package:TikBili/business/common/keep_alive_wrapper.dart';
import 'package:TikBili/business/common/page_data_widget.dart';
import 'package:TikBili/business/common/view_state/state_view_widget.dart';
import 'package:TikBili/business/video/video_item/vertical_video_item_widget.dart';
import 'package:TikBili/business/video/video_view_model.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoContainerPage extends ConsumerStatefulWidget {
  const VideoContainerPage({super.key});

  @override
  ConsumerState<VideoContainerPage> createState() => _VideoContainerPageState();
}

class _VideoContainerPageState extends ConsumerState<VideoContainerPage> with StateViewMixin, PageStateWidgetMixin {
  late final VideoViewModel _videoVM;

  @override
  void initState() {
    super.initState();
    _videoVM = ref.read(videoViewModelProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(videoViewModelProvider);
    return buildView(context, ref, state);
  }

  @override
  Widget buildPagingList(WidgetRef ref) {
    final videoList = ref.watch(videoViewModelProvider.select((v) => v.data?.videoList)) ?? [];
    final currentPageIndex = ref.watch(videoViewModelProvider.select((v)=> v.data?.currentPageIndex)) ?? 0;
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoList.length,
        onPageChanged: (index) {
            _videoVM.updatePageIndex(index);
        },
        itemBuilder: (context, index) {
          var item = videoList[index];
          return SizedBox(
            height: double.infinity,
            child: KeepAliveWrapper(
              keepAlive: (index - currentPageIndex).abs() == 1,
                child: VideoItemWidget(videoItem: item)),
          );
        });
  }

  @override
  void refreshData() {
    _videoVM.refresh();
  }

  @override
  void loadMoreData() {
    _videoVM.loadMoreData();
  }

  @override
  EasyRefreshController? createRefreshController() {
    return _videoVM.refreshController;
  }
}
