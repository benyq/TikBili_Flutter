import 'package:TikBili/utils/app_storage.dart';

class UserStorage {

  static bool isLogin = false;

  static String cookie = "";

  static init() {
     cookie = AppStorage.getString("cookie");
     isLogin = cookie.isNotEmpty;
  }

  static updateLoginState(String newCookie) {
    cookie = newCookie;
    isLogin = cookie.isNotEmpty;
    AppStorage.setString("cookie", newCookie);
  }

}