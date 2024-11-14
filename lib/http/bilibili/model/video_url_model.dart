// To parse this JSON data, do
//
//     final videoUrlModel = videoUrlModelFromJson(jsonString);

import 'dart:convert';

VideoUrlModel videoUrlModelFromJson(String str) => VideoUrlModel.fromJson(json.decode(str));

String videoUrlModelToJson(VideoUrlModel data) => json.encode(data.toJson());

class VideoUrlModel {
  String from;
  String result;
  String message;
  int quality;
  String format;
  int timelength;
  String acceptFormat;
  List<String> acceptDescription;
  List<int> acceptQuality;
  int videoCodecid;
  String seekParam;
  String seekType;
  List<Durl> durl;
  List<SupportFormat> supportFormats;
  dynamic highFormat;
  int lastPlayTime;
  int lastPlayCid;

  VideoUrlModel({
    required this.from,
    required this.result,
    required this.message,
    required this.quality,
    required this.format,
    required this.timelength,
    required this.acceptFormat,
    required this.acceptDescription,
    required this.acceptQuality,
    required this.videoCodecid,
    required this.seekParam,
    required this.seekType,
    required this.durl,
    required this.supportFormats,
    required this.highFormat,
    required this.lastPlayTime,
    required this.lastPlayCid,
  });

  factory VideoUrlModel.fromJson(Map<String, dynamic> json) => VideoUrlModel(
    from: json["from"],
    result: json["result"],
    message: json["message"],
    quality: json["quality"],
    format: json["format"],
    timelength: json["timelength"],
    acceptFormat: json["accept_format"],
    acceptDescription: List<String>.from(json["accept_description"].map((x) => x)),
    acceptQuality: List<int>.from(json["accept_quality"].map((x) => x)),
    videoCodecid: json["video_codecid"],
    seekParam: json["seek_param"],
    seekType: json["seek_type"],
    durl: List<Durl>.from(json["durl"].map((x) => Durl.fromJson(x))),
    supportFormats: List<SupportFormat>.from(json["support_formats"].map((x) => SupportFormat.fromJson(x))),
    highFormat: json["high_format"],
    lastPlayTime: json["last_play_time"],
    lastPlayCid: json["last_play_cid"],
  );

  Map<String, dynamic> toJson() => {
    "from": from,
    "result": result,
    "message": message,
    "quality": quality,
    "format": format,
    "timelength": timelength,
    "accept_format": acceptFormat,
    "accept_description": List<dynamic>.from(acceptDescription.map((x) => x)),
    "accept_quality": List<dynamic>.from(acceptQuality.map((x) => x)),
    "video_codecid": videoCodecid,
    "seek_param": seekParam,
    "seek_type": seekType,
    "durl": List<dynamic>.from(durl.map((x) => x.toJson())),
    "support_formats": List<dynamic>.from(supportFormats.map((x) => x.toJson())),
    "high_format": highFormat,
    "last_play_time": lastPlayTime,
    "last_play_cid": lastPlayCid,
  };
}

class Durl {
  int order;
  int length;
  int size;
  String ahead;
  String vhead;
  String url;
  List<String> backupUrl;

  Durl({
    required this.order,
    required this.length,
    required this.size,
    required this.ahead,
    required this.vhead,
    required this.url,
    required this.backupUrl,
  });

  factory Durl.fromJson(Map<String, dynamic> json) => Durl(
    order: json["order"],
    length: json["length"],
    size: json["size"],
    ahead: json["ahead"],
    vhead: json["vhead"],
    url: json["url"],
    backupUrl: List<String>.from(json["backup_url"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "order": order,
    "length": length,
    "size": size,
    "ahead": ahead,
    "vhead": vhead,
    "url": url,
    "backup_url": List<dynamic>.from(backupUrl.map((x) => x)),
  };
}

class SupportFormat {
  int quality;
  String format;
  String newDescription;
  String displayDesc;
  String superscript;
  dynamic codecs;

  SupportFormat({
    required this.quality,
    required this.format,
    required this.newDescription,
    required this.displayDesc,
    required this.superscript,
    required this.codecs,
  });

  factory SupportFormat.fromJson(Map<String, dynamic> json) => SupportFormat(
    quality: json["quality"],
    format: json["format"],
    newDescription: json["new_description"],
    displayDesc: json["display_desc"],
    superscript: json["superscript"],
    codecs: json["codecs"],
  );

  Map<String, dynamic> toJson() => {
    "quality": quality,
    "format": format,
    "new_description": newDescription,
    "display_desc": displayDesc,
    "superscript": superscript,
    "codecs": codecs,
  };
}
