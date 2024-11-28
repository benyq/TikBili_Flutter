import 'package:TikBili/business/video/videoState.dart';
import 'package:equatable/equatable.dart';

typedef VideoStat = Stat;
typedef VideoPoster = Poster;

class VideoItemState extends Equatable {
  final bool showFullScreen;
  final VideoStat videoStat;
  final PlayerState playerState;
  final VideoPoster poster;
  final VideoDetail videoDetail;
  final LayerState layerState;

  const VideoItemState(
      {required this.videoStat,
      required this.playerState,
      required this.poster,
      required this.videoDetail,
      required this.layerState,
      this.showFullScreen = false});

  copyWith(
      {bool? showFullScreen,
      PlayerState? playerState,
      VideoStat? videoStat,
      VideoDetail? videoDetail,
      LayerState? layerState,
      VideoPoster? poster}) {
    return VideoItemState(
        playerState: playerState ?? this.playerState,
        videoStat: videoStat ?? this.videoStat,
        poster: poster ?? this.poster,
        videoDetail: videoDetail ?? this.videoDetail,
        layerState: layerState ?? this.layerState,
        showFullScreen: showFullScreen ?? this.showFullScreen);
  }

  @override
  List<Object?> get props =>
      [showFullScreen, videoStat, playerState, poster, videoDetail, layerState];
}

class PlayerState extends Equatable {
  final bool isInitialized;
  final bool isPlaying;
  final int playPosition;

  const PlayerState(
      {this.isInitialized = false,
      this.isPlaying = false,
      this.playPosition = 0});

  copyWith({bool? isPlaying, bool? isInitialized, int? playPosition}) {
    return PlayerState(
        isPlaying: isPlaying ?? this.isPlaying,
        isInitialized: isInitialized ?? this.isInitialized,
        playPosition: playPosition ?? this.playPosition);
  }

  @override
  List<Object?> get props => [isInitialized, isPlaying, playPosition];
}

class VideoDetail extends Equatable {
  final String title;
  final String coverImg;
  final double aspectRatio;
  final int duration;

  const VideoDetail(
      {required this.title,
      required this.aspectRatio,
      required this.coverImg,
      required this.duration});

  copyWith(
      {String? title, double? aspectRatio, String? coverImg, int? duration}) {
    return VideoDetail(
        title: title ?? this.title,
        aspectRatio: aspectRatio ?? this.aspectRatio,
        coverImg: coverImg ?? this.coverImg,
        duration: duration ?? this.duration);
  }

  @override
  List<Object?> get props => [title, aspectRatio, coverImg, duration];
}

class LayerState extends Equatable {
  final bool isSliding;
  final double slideValue;

  const LayerState({this.isSliding = false, this.slideValue = 0});

  copyWith({bool? isSliding, double? slideValue}) {
    return LayerState(
        isSliding: isSliding ?? this.isSliding, slideValue: slideValue ?? this.slideValue);
  }

  @override
  List<Object?> get props => [isSliding, slideValue];
}
