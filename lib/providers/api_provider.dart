import 'package:TikBili/http/bilibili/bilibili_server.dart';
import 'package:TikBili/http/bilibili_response.dart';
import 'package:TikBili/http/dio_client.dart';
import 'package:TikBili/utils/log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider((ref) async {
  return BiliBiliServer(DioClient().dio);
});

extension ApiProvider<T> on Future<BiliBiliResponse<T>> {
  Future<T?> handle() async {
    try {
      final response = await this;
      if (response.isSuccess) {
        return response.data;
      } else {
        Log.e("api error: ${response.message}");
        return null;
      }
    }catch(e) {
      Log.e("catch error: $e");
      return null;
    }
  }
}
