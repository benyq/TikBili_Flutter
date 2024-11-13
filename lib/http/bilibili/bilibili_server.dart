import 'package:TikBili/http/bilibili/model/account_model.dart';
import 'package:TikBili/http/bilibili/model/recommend_video_model.dart';
import 'package:TikBili/http/bilibili_response.dart';
import 'package:TikBili/http/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'bilibili_server.g.dart';

@RestApi(baseUrl: 'https://api.bilibili.com/')
abstract class BiliBiliServer {
  factory BiliBiliServer(Dio dio, {String? baseUrl}) {
    return _BiliBiliServer(dio, baseUrl: baseUrl);
  }

  @GET("x/web-interface/index/top/rcmd")
  Future<BiliBiliResponse<RecommendVideoModel>> getRecommendVideoList(
      @Query("ps") int pageSize,
      {@Query("fresh_type") int freshType = 3});

  @GET("x/member/web/account")
  Future<BiliBiliResponse<AccountModel>> getAccountInfo();
}
