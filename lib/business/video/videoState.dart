import 'dart:convert';

import 'package:equatable/equatable.dart';

class VideoState extends Equatable {
  final List<VideoItemModel> videoList;
  final int currentPageIndex;

  const VideoState(this.videoList, this.currentPageIndex);

  @override
  List<Object?> get props => [videoList];

  copyWith({
    List<VideoItemModel>? videoList,
    int? currentPageIndex,
  }) {
    return VideoState(
        videoList ?? this.videoList, currentPageIndex ?? this.currentPageIndex);
  }
}

class VideoItemModel {
  final String bvid;
  final String cid;
  final String title;
  final String coverUrl;
  final String videoUrl;

  final int videoWidth;
  final int videoHeight;
  final int duration;
  final int byteSize;
  final Stat stat;
  final Poster poster;
  final int? id;

  VideoItemModel(
      this.bvid,
      this.cid,
      this.title,
      this.coverUrl,
      this.videoUrl,
      this.videoWidth,
      this.videoHeight,
      this.duration,
      this.byteSize,
      this.stat,
      this.poster,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bvid': bvid,
      'cid': cid,
      'title': title,
      'coverUrl': coverUrl,
      'videoUrl': videoUrl,
      'videoWidth': videoWidth,
      'videoHeight': videoHeight,
      'duration': duration,
      'byteSize': byteSize,
      'stat': json.encode(stat.toMap()),
      'poster': json.encode(poster.toMap())
    };
  }

  factory VideoItemModel.fromMap(Map<String, dynamic> map) {
    return VideoItemModel(
        map['bvid'],
        map['cid'],
        map['title'],
        map['coverUrl'],
        map['videoUrl'],
        map['videoWidth'],
        map['videoHeight'],
        map['duration'],
        map['byteSize'],
        Stat.fromMap(json.decode(map['stat'])),
        Poster.fromMap(json.decode(map['poster'])));
  }

  copyWith({
    String? id,
    String? bvid,
    String? cid,
    String? title,
    String? coverUrl,
    String? videoUrl,
    int? videoWidth,
    int? videoHeight,
    int? duration,
    int? byteSize,
    Stat? stat,
    Poster? poster,
  }) {
    return VideoItemModel(
      bvid ?? this.bvid,
      cid ?? this.cid,
      title ?? this.title,
      coverUrl ?? this.coverUrl,
      videoUrl ?? this.videoUrl,
      videoWidth ?? this.videoWidth,
      videoHeight ?? this.videoHeight,
      duration ?? this.duration,
      byteSize ?? this.byteSize,
      stat ?? this.stat,
      poster ?? this.poster,
    );
  }
}

class Stat {
  final String like;
  final String coin;
  final String reply;
  final String favorite;
  final String share;

  Stat(this.like, this.coin, this.reply, this.favorite, this.share);

  Map<String, dynamic> toMap() {
    return {
      'like': like,
      'coin': coin,
      'reply': reply,
      'favorite': favorite,
      'share': share,
    };
  }

  factory Stat.fromMap(Map<String, dynamic> map) {
    return Stat(
        map['like'], map['coin'], map['reply'], map['favorite'], map['share']);
  }
}

class Poster {
  final String avatar;
  final int uid;
  final String nickName;

  Poster(this.avatar, this.uid, this.nickName);

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'uid': uid,
      'nickName': nickName,
    };
  }

  factory Poster.fromMap(Map<String, dynamic> map) {
    return Poster(map['avatar'], map['uid'], map['nickName']);
  }
}
