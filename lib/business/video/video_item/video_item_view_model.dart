import 'dart:async';

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
  late Timer _playPositionTimer;

  @override
  VideoItemState build(VideoItemModel model) {
    _container = VideoControllerContainer();
    controller = _container.getVideoController(model.bvid, model.videoUrl);
    _initPlayer();
    final aspectRatio = model.videoHeight / model.videoWidth;
    final showFullScreen = aspectRatio > (16 / 9);
    ref.onDispose(() {
      _stopPlayPositionTimer();
      _container.removeVideoController(model.bvid);
    });
    return VideoItemState(
        videoStat: model.stat,
        playerState: const PlayerState(),
        showFullScreen: showFullScreen,
        poster: model.poster,
        layerState: const LayerState(),
        videoDetail: VideoDetail(title: model.title, aspectRatio: aspectRatio, coverImg: model.coverUrl, duration: model.duration));
  }

  void _initPlayer() {
    if (!controller.value.isInitialized) {
      controller.addListener(() {
        state = state.copyWith(
            playerState: state.playerState.copyWith(
                isPlaying: controller.value.isPlaying,
                isInitialized: controller.value.isInitialized));
      });
      controller.initialize().then((_) {
        controller.play();
        _startPlayPositionTimer();
      });
    }
  }

  void seekTo(int position) {
    if (!controller.value.isInitialized) return;
    state = state.copyWith(playerState: state.playerState.copyWith(playPosition: position));
    controller.seekTo(Duration(milliseconds: position));
  }

  void changeLayerSlideState(bool sliding) {
    state = state.copyWith(layerState: state.layerState.copyWith(isSliding: sliding));
  }

  void changeLayerSlideValue(double value) {
    state = state.copyWith(layerState: state.layerState.copyWith(slideValue: value));
  }


  void _startPlayPositionTimer() async{
    _playPositionTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      state = state.copyWith(
          playerState: state.playerState.copyWith(
              playPosition: controller.value.position.inMilliseconds));
    });
  }

  void _stopPlayPositionTimer() {
    if (_playPositionTimer.isActive) {
      _playPositionTimer.cancel();
    }
  }
}
