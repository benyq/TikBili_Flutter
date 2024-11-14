import 'package:TikBili/business/video/item/video_item_widget.dart';
import 'package:TikBili/business/video/video_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoContainerPage extends ConsumerStatefulWidget {
  const VideoContainerPage({super.key});

  @override
  ConsumerState<VideoContainerPage> createState() => _VideoContainerPageState();
}

class _VideoContainerPageState extends ConsumerState<VideoContainerPage> {
  late final VideoViewModel _videoVM;

  @override
  void initState() {
    super.initState();
    _videoVM = ref.read(videoViewModelProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    final videoList =
        ref.watch(videoViewModelProvider.select((v) => v.videoList));
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoList.length,
        itemBuilder: (context, index) {
          var item = videoList[index];
          return VideoItemWidget(videoItem: item);
        });
  }
}
