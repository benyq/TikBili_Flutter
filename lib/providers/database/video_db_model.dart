class VideoDBModel {
  final String bvid;
  final int cid;
  final String title;
  final String coverUrl;
  final int videoWidth;
  final int videoHeight;

  final String videoUrl;
  final int duration;
  final int byteSize;

  final String stat;
  final String poster;
  final int? id;


  VideoDBModel(this.bvid, this.cid, this.title, this.coverUrl, this.videoUrl, this.videoWidth, this.videoHeight, this.duration, this.byteSize, this.stat, this.poster, {this.id});

  toJson() {
    return {
      'bvid': bvid,
      'cid': cid,
      'title': title,
      'coverUrl': coverUrl,
      'videoUrl': videoUrl,
      'videoWidth': videoWidth,
      'videoHeight': videoHeight,
      'duration': duration,
      'byteSize': byteSize,
      'stat': stat,
      'poster': poster
    };

  }


}