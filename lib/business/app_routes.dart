import 'package:TikBili/business/data/user_storage.dart';
import 'package:TikBili/business/home_page.dart';
import 'package:TikBili/business/login_page.dart';
import 'package:TikBili/business/splash_page.dart';
import 'package:TikBili/business/video/videoState.dart';
import 'package:TikBili/business/video/video_item/horizontal_video_item_widget.dart';
import 'package:TikBili/utils/log.dart';
import 'package:flutter/cupertino.dart';



class AppRoutes {
  static const indexPage = "/";
  static const loginPage = "/login";
  static const homePage = "/homePage";
  static const fullScreenVideoPage = "/fullScreenVideoPage";
  static const needLoginCheckPages = [

  ];


  static final Map<String, Widget Function(BuildContext, Object?)> routes = {
    indexPage: (context, args) => const SplashPage(),
    loginPage: (context, args) => const LoginPage(),
    homePage: (context, args) => const HomePage(),
    fullScreenVideoPage: (context, args) {
      return HorizontalVideoItemWidget(
        videoItem: args as VideoItemModel,
      );
    },
  };

  static loginCheck(String? pageName) {
    if (!needLoginCheckPages.contains(pageName)) {
      return true;
    }
    // check if login
    return UserStorage.isLogin;
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Log.i('page: ${settings.name}, args: ${settings.arguments}');
    if (!loginCheck(settings.name)) {
      return CupertinoPageRoute(
        builder: (context) {
          return const LoginPage();
        },
      );
    }

    final route = AppRoutes.routes[settings.name];
    if (route == null) return null;

    return CupertinoPageRoute(
      builder: (context) {
        return route.call(context, settings.arguments);
      },
    );
  }
}
