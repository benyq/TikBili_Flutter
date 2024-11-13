import 'package:TikBili/business/data/user_storage.dart';
import 'package:TikBili/utils/app_storage.dart';

class StartUp {
  static Future<void> init() async {
    await AppStorage.init();
    UserStorage.init();
  }
}
