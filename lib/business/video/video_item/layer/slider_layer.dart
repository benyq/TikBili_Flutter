import 'package:TikBili/business/video/videoState.dart';
import 'package:TikBili/business/video/video_item/video_item_view_model.dart';
import 'package:TikBili/utils/time_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderLayer extends ConsumerStatefulWidget {
  final VideoItemModel videoItem;
  final bool isVertical;
  final VoidCallback? onTap;

  const SliderLayer(
      {super.key,
      required this.videoItem,
      required this.isVertical,
      this.onTap});

  @override
  ConsumerState<SliderLayer> createState() => _SliderLayerState();
}

class _SliderLayerState extends ConsumerState<SliderLayer> {
  late VideoItemViewModel _videoItemVM;

  @override
  void initState() {
    super.initState();
    _videoItemVM =
        ref.read(videoItemViewModelProvider(widget.videoItem).notifier);
  }

  @override
  Widget build(BuildContext context) {
    final sliding = ref.watch(videoItemViewModelProvider(widget.videoItem)
        .select((v) => v.layerState.isSliding));
    final slideValue = ref.watch(videoItemViewModelProvider(widget.videoItem)
        .select((v) => v.layerState.slideValue));
    //TODO 直接拿position会导致页面不停地刷新,要用timer
    final position = ref.watch(videoItemViewModelProvider(widget.videoItem)
        .select((v) => v.playerState.playPosition));
    final duration = ref.watch(videoItemViewModelProvider(widget.videoItem)
        .select((v) => v.videoDetail.duration));
    final ratio = position / duration;
    return widget.isVertical
        ? _vertical_slider(sliding, position, slideValue, ratio, duration)
        : _horizontalSlider(sliding, slideValue, ratio, position, duration);
  }

  Widget _vertical_slider(bool sliding, int position, double slideValue,
      double ratio, int duration) {
    return SizedBox(
      width: double.maxFinite,
      height: 200.w,
      child: Stack(
        children: [
          Positioned(
              child: sliding
                  ? SizedBox(
                      width: double.maxFinite,
                      height: 200.w,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.2)
                          ]))),
                    )
                  : const SizedBox()),
          Positioned(
              bottom: 20.w,
              left: 15.w,
              right: 15.w,
              child: SizedBox(
                width: double.maxFinite,
                height: 120.w,
                child: Column(
                  children: [
                    Expanded(
                        child: Visibility(
                            visible: sliding,
                            child: Transform.translate(
                                offset: Offset(0, 20.w),
                                child: Text(
                                  "${TimeUtils.time2String(position)}  /  ${TimeUtils.time2String(duration)}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                )))),
                    Row(
                      children: [
                        Expanded(
                            child: Slider(
                          value: sliding ? slideValue : ratio,
                          onChanged: (v) {
                            _videoItemVM.changeLayerSlideValue(v);
                          },
                          onChangeStart: (v) {
                            // Future((){
                            _videoItemVM.changeLayerSlideState(true);
                            // });
                          },
                          onChangeEnd: (v) {
                            _videoItemVM.changeLayerSlideState(false);
                            _videoItemVM.seekTo((v * duration).toInt());
                          },
                        )),
                        GestureDetector(
                            onTap: widget.onTap,
                            child: Icon(
                              Icons.fullscreen,
                              size: 25.w,
                            ))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _horizontalSlider(
      bool sliding, double slideValue, double ratio, int position, int duration) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(TimeUtils.time2String(position), style: TextStyle(fontSize: 8.sp,),),
          Expanded(
            child: Slider(
              value: sliding ? slideValue : ratio,
              onChanged: (v) {
                _videoItemVM.changeLayerSlideValue(v);
              },
              onChangeStart: (v) {
                // Future((){
                _videoItemVM.changeLayerSlideState(true);
                // });
              },
              onChangeEnd: (v) {
                _videoItemVM.changeLayerSlideState(false);
                _videoItemVM.seekTo((v * duration).toInt());
              },
            ),
          ),
          Text(TimeUtils.time2String(duration), style: TextStyle(fontSize: 8.sp,),),
        ],
      ),
    );
  }
}
