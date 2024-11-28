import 'package:TikBili/business/common/expandable_text.dart';
import 'package:TikBili/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoDescriptionLayer extends StatelessWidget {

  final String nickName;
  final String title;

  const VideoDescriptionLayer({super.key, required this.nickName, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '@$nickName',
          style: TextStyle(fontSize: 16.sp, color: Colors.white),
        ),
        5.hSize,
        ExpandableText(
          text: title,
          maxLines: 2,
          textStyle:
          TextStyle(fontSize: 14.sp, color: Colors.white),
        )
      ],
    );
  }
}


