import 'package:TikBili/business/video/videoState.dart';
import 'package:flutter/material.dart';

class VideoItemWidget extends StatefulWidget {
  final VideoItemModel videoItem;

  const VideoItemWidget({super.key, required this.videoItem});

  @override
  State<VideoItemWidget> createState() => _VideoItemWidgetState();
}

class _VideoItemWidgetState extends State<VideoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${widget.videoItem.title}', style: TextStyle(color: Colors.white),),
    );
  }
}
