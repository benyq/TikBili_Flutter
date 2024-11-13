import 'package:TikBili/business/app_routes.dart';
import 'package:TikBili/business/data/user_storage.dart';
import 'package:TikBili/utils/asset_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _hide = false;
  bool _show = false;
  final double _logoSize = 60.w;
  final double _logoMargin = 40.w;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300))
        .then((value) => setState(() {
              _hide = !_hide;
            }));
    Future.delayed(const Duration(milliseconds: 1000))
        .then((value) => setState(() {
              _show = !_show;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildMoveLogo(_logoSize, _hide, true, 'tiktok'),
          _buildMoveLogo(_logoSize, _hide, false, 'bilibili'),
          Positioned(
            top: ScreenUtil().screenHeight / 2 -
                _logoSize -
                ScreenUtil().statusBarHeight,
            left: ScreenUtil().screenWidth / 2 - _logoSize / 2,
            child: AnimatedOpacity(
              opacity: _show ? 1 : 0,
              duration: const Duration(milliseconds: 1500),
              child: Column(
                children: [
                  SvgPicture.asset(
                      width: _logoSize,
                      height: _logoSize,
                      'tikbili'.svg,
                      semanticsLabel: 'tikbili'),
                  const SizedBox(height: 20),
                  Text(
                    'TikBili',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ],
              ),
              onEnd: () {
                if (UserStorage.isLogin) {
                  Navigator.pushReplacementNamed(context, AppRoutes.homePage);
                } else {
                  Navigator.pushReplacementNamed(context, AppRoutes.loginPage);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMoveLogo(double size, bool isMoved, bool isLeft, String asset) {
    return AnimatedPositioned(
      duration: const Duration(seconds: 1),
      top: isMoved ? ScreenUtil().screenHeight / 2 - size : _logoMargin,
      left: isLeft
          ? (isMoved ? ScreenUtil().screenWidth / 2 - size / 2 : _logoMargin)
          : null,
      right: !isLeft
          ? (isMoved ? ScreenUtil().screenWidth / 2 - size / 2 : _logoMargin)
          : null,
      child: AnimatedOpacity(
        opacity: isMoved ? 0 : 1,
        duration: const Duration(seconds: 1),
        child: SvgPicture.asset(
            width: size, height: size, asset.svg, semanticsLabel: asset),
      ),
    );
  }
}
