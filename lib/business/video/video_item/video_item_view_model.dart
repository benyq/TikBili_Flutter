import 'package:TikBili/business/video/videoState.dart';
import 'package:TikBili/business/video/video_controller_container.dart';
import 'package:TikBili/business/video/video_item/video_item_state.dart';
import 'package:TikBili/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'video_item_view_model.g.dart';

@riverpod
class VideoItemViewModel extends _$VideoItemViewModel {

  late VideoControllerContainer _container;
  late VideoPlayerController controller;

  @override
  VideoItemState build(VideoItemModel model) {
    _container = VideoControllerContainer();
    controller = _container.getVideoController(model.bvid, model.videoUrl);
    _initPlayer();
    final showFullScreen = (model.videoHeight / model.videoWidth) > (16 / 9);
    ref.onDispose((){
      Log.d("videoItemViewModel dispose ${model.bvid}");
      _container.removeVideoController(model.bvid);
    });
    return VideoItemState(isPlaying: false, showFullScreen: showFullScreen);
  }


  void _initPlayer() {
    if (!controller.value.isInitialized) {
      controller.addListener((){
        Log.d("videoItemViewModel state ${controller.value}");
        state = state.copyWith(isPlaying: controller.value.isPlaying, isInitialized: controller.value.isInitialized);
      });
      controller.initialize().then((_) {
        Log.d("videoItemViewModel initialize ${model.bvid}");
        controller.play();
      });
    }
  }
}