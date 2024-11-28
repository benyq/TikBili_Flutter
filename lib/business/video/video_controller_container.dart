import 'package:video_player/video_player.dart';

class VideoControllerContainer {
  static final VideoControllerContainer _instance =
      VideoControllerContainer._internal();

  factory VideoControllerContainer() => _instance;

  VideoControllerContainer._internal();

  final Map<String, VideoPlayerController> _videoControllers = {};

  VideoPlayerController getVideoController(String videoId, String url) {
    return _videoControllers[videoId] ??
        _videoControllers.putIfAbsent(
            videoId,
            () =>
                VideoPlayerController.networkUrl(Uri.parse(url), httpHeaders: {
                  'Referer': 'https://www.bilibili.com',
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                }))..setLooping(true);
  }

  VideoPlayerController? videoController(String videoId) {
    return _videoControllers[videoId];
  }

  void removeVideoController(String videoId) {
    _videoControllers.remove(videoId)?.dispose();
  }
}
