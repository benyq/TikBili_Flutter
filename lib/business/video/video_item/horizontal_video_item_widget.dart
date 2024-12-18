import 'package:TikBili/business/video/videoState.dart';
import 'package:TikBili/business/video/video_item/layer/horizontal_controller_layer.dart';
import 'package:TikBili/business/video/video_item/video_item_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class HorizontalVideoItemWidget extends ConsumerStatefulWidget {

  final VideoItemModel videoItem;

  const HorizontalVideoItemWidget({super.key, required this.videoItem});

  @override
  ConsumerState<HorizontalVideoItemWidget> createState() => HorizontalVideoItemWidgetState();
}

class HorizontalVideoItemWidgetState extends ConsumerState<HorizontalVideoItemWidget> {

  late VideoItemViewModel _videoItemVM;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays:[]);
    _videoItemVM = ref.read(videoItemViewModelProvider.call(widget.videoItem).notifier);
    _controller = _videoItemVM.controller;
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result){
        if(didPop){
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        }
      },
      child: Container(
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
            HorizontalControllerLayer(videoItem: widget.videoItem,)
          ],
        ),
      ),
    );
  }
}
