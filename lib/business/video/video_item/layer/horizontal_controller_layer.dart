import 'dart:async';

import 'package:TikBili/business/video/videoState.dart';
import 'package:TikBili/business/video/video_item/layer/slider_layer.dart';
import 'package:TikBili/business/video/video_item/video_item_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalControllerLayer extends ConsumerStatefulWidget {
  final VideoItemModel videoItem;

  const HorizontalControllerLayer({super.key, required this.videoItem});

  @override
  ConsumerState<HorizontalControllerLayer> createState() =>
      _HorizontalControllerLayerState();
}

class _HorizontalControllerLayerState extends ConsumerState<HorizontalControllerLayer> {

  Timer? _timer = null;
  bool _showController = false;
  late VideoItemViewModel _videoItemVM;

  @override
  void initState() {
    super.initState();
    _videoItemVM = ref.read(videoItemViewModelProvider.call(widget.videoItem).notifier);
  }

  @override
  void dispose() {
    super.dispose();
    _cancelDismissControllerTimer();
  }

  @override
  Widget build(BuildContext context) {
    bool isPlaying = ref.watch(videoItemViewModelProvider.call(widget.videoItem).select((v)=>v.playerState.isPlaying));
    final controller = _videoItemVM.controller;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (!_showController) {
          _startDismissControllerTimer();
        }
        setState(() {
          _showController = !_showController;
        });
      },
      child: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
              child: Visibility(
                visible: _showController,
                  child: _titleBar(widget.videoItem.title)),
            ),
            Align(
              alignment: Alignment.center,
              child: Visibility(
                visible: _showController,
                child: GestureDetector(
                  onTap: () {
                    _cancelDismissControllerTimer();
                    if (isPlaying) {
                      controller.pause();
                    } else {
                      controller.play();
                    }                },
                  child: Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    size: 100,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Visibility(
                visible: _showController,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width, child: _progressBar()),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _titleBar(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
      color: Colors.black.withOpacity(0.5),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 15.w,
            ),
          ),
          Expanded(
              child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 9.sp,
                overflow: TextOverflow.ellipsis),
          ))
        ],
      ),
    );
  }

  Widget _progressBar() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
        color: Colors.black.withOpacity(0.5),
        height: 35.w,
        width: double.infinity,
        child: Center(child: SliderLayer(videoItem: widget.videoItem, isVertical: false)));
  }

  void _startDismissControllerTimer() {
    _cancelDismissControllerTimer();
    _timer = Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        _showController = false;
      });
    });
  }

  void _cancelDismissControllerTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
