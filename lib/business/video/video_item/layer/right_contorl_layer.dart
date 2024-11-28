import 'package:TikBili/utils/widget_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RightControllerLayer extends StatelessWidget {

  final RightControllerState state;
  const RightControllerLayer({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAvatar(),
        5.hSize,
        _buildButton(Icons.thumb_up, state.likeCount, state.isLiked ? Colors.red : Colors.white, 20.w),
        10.hSize,
        _buildButton(Icons.comment, state.commentCount, Colors.white, 20.w),
        10.hSize,
        _buildButton(Icons.currency_bitcoin_rounded, state.coinCount, state.isCoined ? Colors.red : Colors.white, 25.w),
        10.hSize,
        _buildButton(Icons.star_rounded, state.likeCount, state.isCoined ? Colors.yellow : Colors.white, 25.w),
        10.hSize,
        _buildButton(Icons.share_rounded, state.shareCount, state.isCoined ? Colors.red : Colors.white, 25.w),
      ],
    );
  }


  Widget _buildAvatar() {
    return Column(
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2.w),
            borderRadius: BorderRadius.circular(50.0), // 使得边框为圆形
          ),
          child: ClipOval(child: CachedNetworkImage(imageUrl: state.avatarIcon)),
        ),
        state.isFollowed ? 10.hSize :
            Transform.translate(
              offset: Offset(0, -10.w),
              child: GestureDetector(
                onTap: () {

                },
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child: Text('+', style: TextStyle(fontSize: 14.sp, color: Colors.white)),
                )
              ),
            )
      ],
    );
  }

  Widget _buildButton(IconData icon, String text,
      Color color,double iconSize) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: iconSize, color: color,),
        5.hSize,
        Text(text, style: TextStyle(fontSize: 14.sp, color: Colors.white))
      ],
    );
  }

}




class RightControllerState {
  final bool isLiked;
  final bool isComment;
  final bool isCoined;
  final bool isStar;
  final bool isShare;

  final String likeCount;
  final String commentCount;
  final String coinCount;
  final String starCount;
  final String shareCount;

  final String avatarIcon;
  final bool isFollowed;

  RightControllerState({
    this.isLiked = false,
    this.isComment = false,
    this.isCoined = false,
    this.isStar = false,
    this.isShare = false,
    this.likeCount = '0',
    this.commentCount = '0',
    this.coinCount = '0',
    this.starCount = '0',
    this.shareCount = '0',
    this.avatarIcon = '',
    this.isFollowed = false
  });

  RightControllerState copyWith({
    bool? isLiked,
    bool? isComment,
    bool? isCoined,
    bool? isStar,
    bool? isShare,
    String? likeCount,
    String? commentCount,
    String? coinCount,
    String? starCount,
    String? shareCount,
    String? avatarIcon,
    bool? isFollowed
  }) {
    return RightControllerState(
      isLiked: isLiked ?? this.isLiked,
      isComment: isComment ?? this.isComment,
      isCoined: isCoined ?? this.isCoined,
      isStar: isStar ?? this.isStar,
      isShare: isShare ?? this.isShare,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      coinCount: coinCount ?? this.coinCount,
      starCount: starCount ?? this.starCount,
      shareCount: shareCount ?? this.shareCount,
      avatarIcon: avatarIcon ?? this.avatarIcon,
      isFollowed: isFollowed ?? this.isFollowed
    );
  }
}