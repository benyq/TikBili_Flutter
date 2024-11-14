import 'package:equatable/equatable.dart';

class VideoState extends Equatable {

  final List<VideoItemModel> videoList;

  const VideoState(this.videoList);

  @override
  List<Object?> get props => [videoList];

  copyWith({
    List<VideoItemModel>? videoList,
  }) {
    return VideoState(videoList ?? this.videoList);
  }
}

class VideoItemModel {
  final String id;
  final String title;
  final String coverUrl;
  final String videoUrl;

  final int videoWidth;
  final int videoHeight;
  final int duration;
  final int byteSize;
  final Stat stat;
  final Poster poster;

  VideoItemModel(this.id, this.title, this.coverUrl, this.videoUrl,
      this.videoWidth, this.videoHeight, this.duration, this.byteSize, this.stat,
      this.poster);
}

class Stat {
  final String like;
  final String coin;
  final String reply;
  final String favorite;
  final String share;

  Stat(this.like, this.coin, this.reply, this.favorite, this.share);
}

class Poster {
  final String avatar;
  final int uid;
  final String nickName;

  Poster(this.avatar, this.uid, this.nickName);
}