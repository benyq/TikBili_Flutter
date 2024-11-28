import 'package:TikBili/business/app_routes.dart';
import 'package:TikBili/business/video/videoState.dart';
import 'package:TikBili/business/video/video_item/layer/right_contorl_layer.dart';
import 'package:TikBili/business/video/video_item/layer/slider_layer.dart';
import 'package:TikBili/business/video/video_item/layer/video_description_layer.dart';
import 'package:TikBili/business/video/video_item/video_item_state.dart';
import 'package:TikBili/business/video/video_item/video_item_view_model.dart';
import 'package:TikBili/utils/log.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoItemWidget extends ConsumerStatefulWidget {
  final VideoItemModel videoItem;

  const VideoItemWidget({super.key, required this.videoItem});

  @override
  ConsumerState<VideoItemWidget> createState() => _VideoItemWidgetState();
}

class _VideoItemWidgetState extends ConsumerState<VideoItemWidget> {
  late VideoItemViewModel _videoItemVM;
  late VideoItemModel _videoItem;

  @override
  void initState() {
    super.initState();
    _videoItem = widget.videoItem;
    _videoItemVM = ref.read(videoItemViewModelProvider(_videoItem).notifier);
  }

  @override
  Widget build(BuildContext context) {
    final isInitialized = ref.watch(
        videoItemViewModelProvider(_videoItem).select((v) => v.playerState.isInitialized));
    final isPlaying = ref.watch(
        videoItemViewModelProvider(_videoItem).select((v) => v.playerState.isPlaying));

    final videoStat = ref.watch(
        videoItemViewModelProvider(_videoItem).select((v) => v.videoStat));
    final poster = ref
        .watch(videoItemViewModelProvider(_videoItem).select((v) => v.poster));
    final videoDetail = ref.watch(
        videoItemViewModelProvider(_videoItem).select((v) => v.videoDetail));
    final layerState = ref.watch(videoItemViewModelProvider(_videoItem)
        .select((v) => v.layerState));
    final controller = _videoItemVM.controller;
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (!isInitialized) return;
          if (isPlaying) {
            controller.pause();
          } else {
            controller.play();
          }
        },
        child: Stack(
          children: [
            Positioned(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Center(
                        child: isInitialized
                            ? AspectRatio(
                                aspectRatio: controller.value.aspectRatio,
                                child: VideoPlayer(controller),
                              )
                            : CachedNetworkImage(
                                imageUrl: videoDetail.coverImg)))),
            Positioned(
                child: Visibility(
              visible: !isPlaying,
              child: Center(
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 100,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            )),
            Positioned(
                right: 10.w,
                bottom: 90.w,
                child: layerState.isSliding ? const SizedBox() : RightControllerLayer(
                    state: _buildRightControllerState(videoStat, poster))),
            Positioned(
                left: 15.w,
                right: 60.w,
                bottom: 70.w,
                child: layerState.isSliding ? const SizedBox() : VideoDescriptionLayer(
                    nickName: poster.nickName, title: videoDetail.title)),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SliderLayer(
                  videoItem: _videoItem,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.fullScreenVideoPage,
                        arguments: _videoItem);
                  },
                ))
          ],
        ),
      ),
    );
  }

  RightControllerState _buildRightControllerState(
      VideoStat stat, VideoPoster poster) {
    return RightControllerState(
        likeCount: stat.like,
        coinCount: stat.coin,
        commentCount: stat.reply,
        starCount: stat.favorite,
        shareCount: stat.share,
        avatarIcon: poster.avatar);
  }
}
