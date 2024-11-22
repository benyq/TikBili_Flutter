import 'package:equatable/equatable.dart';

class VideoItemState extends Equatable{
  final bool isInitialized;
  final bool isPlaying;
  final bool showFullScreen;

  const VideoItemState({this.isInitialized = false, this.isPlaying = false, this.showFullScreen = false});

  copyWith({bool? isPlaying, bool? showFullScreen, bool? isInitialized}) {
    return VideoItemState(
      isPlaying: isPlaying ?? this.isPlaying,
      showFullScreen: showFullScreen ?? this.showFullScreen,
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }

  @override
  List<Object?> get props => [isPlaying, showFullScreen, isInitialized];
}