import 'package:TikBili/business/app_routes.dart';
import 'package:TikBili/business/video/videoState.dart';
import 'package:TikBili/business/video/video_controller_container.dart';
import 'package:TikBili/business/video/video_item/video_item_view_model.dart';
import 'package:TikBili/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoItemWidget extends ConsumerStatefulWidget {
  final VideoItemModel videoItem;

  const VideoItemWidget({super.key, required this.videoItem});

  @override
  ConsumerState<VideoItemWidget> createState() => _VideoItemWidgetState();
}

class _VideoItemWidgetState extends ConsumerState<VideoItemWidget> {

  late VideoItemViewModel _videoItemVM;

  @override
  void initState() {
    super.initState();
    _videoItemVM = ref.read(videoItemViewModelProvider(widget.videoItem).notifier);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(videoItemViewModelProvider(widget.videoItem));
    final controller = _videoItemVM.controller;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: state.isInitialized
              ? Center(
                child: GestureDetector(
                  onTap: (){
                    if (state.isPlaying) {
                      controller.pause();
                    }else {
                      controller.play();
                    }
                  },
                  child: AspectRatio(
                              aspectRatio: controller.value.aspectRatio,
                              child: VideoPlayer(controller),
                            ),
                ),
              )
              : Container(),),
          Positioned(child: Center(
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, AppRoutes.fullScreenVideoPage, arguments: widget.videoItem);
              },
                child: const Icon(Icons.fullscreen)),
          )),
          Positioned(
            child: state.isPlaying
              ? const SizedBox()
              : Icon(
                Icons.play_arrow_rounded,
                size: 100,
              color: Colors.white.withOpacity(0.5),
              ),
          ),
        ],
      ),
    );
  }
}
