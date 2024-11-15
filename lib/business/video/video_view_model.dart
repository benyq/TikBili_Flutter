import 'package:TikBili/business/video/videoState.dart';
import 'package:TikBili/providers/api_provider.dart';
import 'package:TikBili/utils/string_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_view_model.g.dart';

@riverpod
class VideoViewModel extends _$VideoViewModel {
  int _page = 0;

  @override
  VideoState build() {
    getRecommendVideo();
    return const VideoState([]);
  }

  void getRecommendVideo() async {
    var api = await ref.read(apiProvider);
    var data = await api.getRecommendVideoList(_page).handle();
    if (data == null) return;
    var fetchData = [];
    var videos = data.item.take(1);
    for (var e in videos) {
      var videoDetail = await api.videoInfo(e.bvid).handle();
      if (videoDetail == null) continue;
      var videoUrl = await api.videoUrl(e.bvid, e.cid.toString()).handle();
      if (videoUrl == null) continue;
      var url = videoUrl.durl.first;
      fetchData.add(VideoItemModel(
          videoDetail.bvid,
          videoDetail.title,
          videoDetail.pic,
          url.url,
          videoDetail.dimension.width,
          videoDetail.dimension.height,
          url.length,
          url.size,
          Stat(
              StringUtil.num2String(videoDetail.stat.like),
              StringUtil.num2String(videoDetail.stat.coin),
              StringUtil.num2String(videoDetail.stat.reply),
              StringUtil.num2String(videoDetail.stat.favorite),
              StringUtil.num2String(videoDetail.stat.share)),
          Poster(videoDetail.owner.face, videoDetail.owner.mid,
              videoDetail.owner.name)));
    }
    state = state.copyWith(videoList: [...state.videoList, ...fetchData]);
  }
}
