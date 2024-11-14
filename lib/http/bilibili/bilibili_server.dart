import 'package:TikBili/http/bilibili/model/account_model.dart';
import 'package:TikBili/http/bilibili/model/recommend_video_model.dart';
import 'package:TikBili/http/bilibili/model/video_info_model.dart';
import 'package:TikBili/http/bilibili/model/video_reply_model.dart';
import 'package:TikBili/http/bilibili/model/video_url_model.dart';
import 'package:TikBili/http/bilibili_response.dart';
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


  @GET("x/web-interface/view")
  Future<BiliBiliResponse<VideoInfoModel>> videoInfo(@Query("bvid") String bvid);


  @GET("x/player/playurl")
  Future<BiliBiliResponse<VideoUrlModel>> videoUrl(@Query("bvid")String bvid, @Query("cid") String cid, {@Query("qn") String qn = "80"});

  @GET("x/v2/reply")
  Future<BiliBiliResponse<VideoReplyModel>> videoReply(@Query("oid") String oid, @Query("pn") int pn, {@Query("type") int type = 1, @Query("mode") int mode = 3, @Query("ps") int ps = 20});

}
