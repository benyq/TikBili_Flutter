import 'package:TikBili/business/common/page_data_widget.dart';
import 'package:TikBili/business/common/view_state/view_state.dart';
import 'package:TikBili/business/video/videoState.dart';
import 'package:TikBili/http/bilibili/model/recommend_video_model.dart' as recommendVideo;
import 'package:TikBili/http/bilibili/model/video_url_model.dart';
import 'package:TikBili/providers/api_provider.dart';
import 'package:TikBili/providers/db_provider.dart';
import 'package:TikBili/utils/log.dart';
import 'package:TikBili/utils/string_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_view_model.g.dart';

@riverpod
class VideoViewModel extends _$VideoViewModel with PageLogic{

  @override
  ViewState<VideoState> build() {
    initData();
    return const ViewState(data: VideoState([]));
  }

  void initData() {
    queryLocalVideo();
    refresh();
  }

  void refresh() async {
    var api = await ref.read(apiProvider);
    sendRefreshPagingRequest(()=>api.getRecommendVideoList(page), (data){
      _handleRecommendData(data, refresh: true);
    });
  }

  void loadMoreData() async{
    var api = await ref.read(apiProvider);
    sendLoadMorePagingRequest(api.getRecommendVideoList(page), (data){
      _handleRecommendData(data);
    });
  }

  void _handleRecommendData(recommendVideo.RecommendVideoModel data, {bool refresh = false}) {
    final length = data.item.length;
    final videoList1 = data.item.sublist(0, length ~/ 2);
    final videoList2 = data.item.sublist(length ~/ 2);
    getVideoDetail(videoList1, false).then((v){
      final newData = refresh ? v : [...?state.data?.videoList, ...v];
      state = state.successState(state.data?.copyWith(videoList: newData));
    });
    getVideoDetail(videoList2, true).then((v)=>saveVideo(v));
  }

  Future<List<VideoItemModel>> getVideoDetail(List<recommendVideo.Item> videos, bool ignoreUrl)async {
    var api = await ref.read(apiProvider);
    List<VideoItemModel> fetchData = [];
    for (var e in videos) {
      var videoDetail = await api.videoInfo(e.bvid).handle();
      if (videoDetail == null) continue;
      Durl? urlInfo;
      if (!ignoreUrl) {
        urlInfo = await videoUrlInfo(e.bvid, e.cid.toString());
        if (urlInfo == null) continue;
      }
      fetchData.add(VideoItemModel(
          videoDetail.bvid,
          videoDetail.cid.toString(),
          videoDetail.title,
          videoDetail.pic,
          urlInfo?.url ?? '',
          videoDetail.dimension.width,
          videoDetail.dimension.height,
          urlInfo?.length ?? 0,
          urlInfo?.size ?? 0,
          Stat(
              StringUtil.num2String(videoDetail.stat.like),
              StringUtil.num2String(videoDetail.stat.coin),
              StringUtil.num2String(videoDetail.stat.reply),
              StringUtil.num2String(videoDetail.stat.favorite),
              StringUtil.num2String(videoDetail.stat.share)),
          Poster(videoDetail.owner.face, videoDetail.owner.mid,
              videoDetail.owner.name)));
    }
    return fetchData;
  }

  Future<int> queryLocalVideo() async{
    final db = await ref.read(dbProvider);
    var dbData = await db.query('t_video');
    var data = dbData.take(5);
    List<VideoItemModel> videoList = [];
    for (var e in data) {
      var item = VideoItemModel.fromMap(e);
      if (item.videoUrl.isEmpty) {
        var urlInfo = await videoUrlInfo(item.bvid, item.cid);
        if (urlInfo == null) continue;
        item = item.copyWith(videoUrl: urlInfo.url, duration: urlInfo.length, byteSize: urlInfo.size);
      }
      videoList.add(item);
    }
    state = state.successState(state.data?.copyWith(videoList: [...?state.data?.videoList, ...videoList]));
    //删除旧记录
    final res = await db.delete('t_video', where: 'id IN (${data.map((e) => e['id']).join(',')})');
    Log.d('queryVideo delete used: ${videoList.length}, d: $res');
    return data.length;
  }
  
  void saveVideo(List<VideoItemModel> videoList) async{
    final db = await ref.read(dbProvider);
    await db.transaction((txn)async {
      final batch = txn.batch();
      for (VideoItemModel video in videoList) {
        batch.insert('t_video', video.toMap());
      }
      await batch.commit(noResult: true);
    });

  }

  Future<Durl?> videoUrlInfo(String bvid, String cid) async{
    final api = await ref.read(apiProvider);
    var videoUrl = await api.videoUrl(bvid, cid).handle();
    return videoUrl?.durl.first;
  }
}
