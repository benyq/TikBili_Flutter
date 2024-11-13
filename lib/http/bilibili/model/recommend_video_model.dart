// To parse this JSON data, do
//
//     final recommendVideoModel = recommendVideoModelFromJson(jsonString);

import 'dart:convert';

RecommendVideoModel recommendVideoModelFromJson(String str) => RecommendVideoModel.fromJson(json.decode(str));

String recommendVideoModelToJson(RecommendVideoModel data) => json.encode(data.toJson());

class RecommendVideoModel {
  List<Item>? item;
  dynamic businessCard;
  dynamic floorInfo;
  dynamic userFeature;
  Abtest? abtest;
  int? preloadExposePct;
  int? preloadFloorExposePct;
  int? mid;

  RecommendVideoModel({
    this.item,
    this.businessCard,
    this.floorInfo,
    this.userFeature,
    this.abtest,
    this.preloadExposePct,
    this.preloadFloorExposePct,
    this.mid,
  });

  factory RecommendVideoModel.fromJson(Map<String, dynamic> json) => RecommendVideoModel(
    item: json["item"] == null ? [] : List<Item>.from(json["item"]!.map((x) => Item.fromJson(x))),
    businessCard: json["business_card"],
    floorInfo: json["floor_info"],
    userFeature: json["user_feature"],
    abtest: json["abtest"] == null ? null : Abtest.fromJson(json["abtest"]),
    preloadExposePct: json["preload_expose_pct"],
    preloadFloorExposePct: json["preload_floor_expose_pct"],
    mid: json["mid"],
  );

  Map<String, dynamic> toJson() => {
    "item": item == null ? [] : List<dynamic>.from(item!.map((x) => x.toJson())),
    "business_card": businessCard,
    "floor_info": floorInfo,
    "user_feature": userFeature,
    "abtest": abtest?.toJson(),
    "preload_expose_pct": preloadExposePct,
    "preload_floor_expose_pct": preloadFloorExposePct,
    "mid": mid,
  };
}

class Abtest {
  String? group;

  Abtest({
    this.group,
  });

  factory Abtest.fromJson(Map<String, dynamic> json) => Abtest(
    group: json["group"],
  );

  Map<String, dynamic> toJson() => {
    "group": group,
  };
}

class Item {
  int? id;
  String? bvid;
  int? cid;
  Goto? goto;
  String? uri;
  String? pic;
  String? pic43;
  String? title;
  int? duration;
  int? pubdate;
  Owner? owner;
  Stat? stat;
  dynamic avFeature;
  int? isFollowed;
  RcmdReason? rcmdReason;
  int? showInfo;
  String? trackId;
  int? pos;
  dynamic roomInfo;
  dynamic ogvInfo;
  dynamic businessInfo;
  int? isStock;
  int? enableVt;
  String? vtDisplay;
  int? dislikeSwitch;
  int? dislikeSwitchPc;

  Item({
    this.id,
    this.bvid,
    this.cid,
    this.goto,
    this.uri,
    this.pic,
    this.pic43,
    this.title,
    this.duration,
    this.pubdate,
    this.owner,
    this.stat,
    this.avFeature,
    this.isFollowed,
    this.rcmdReason,
    this.showInfo,
    this.trackId,
    this.pos,
    this.roomInfo,
    this.ogvInfo,
    this.businessInfo,
    this.isStock,
    this.enableVt,
    this.vtDisplay,
    this.dislikeSwitch,
    this.dislikeSwitchPc,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    bvid: json["bvid"],
    cid: json["cid"],
    goto: gotoValues.map[json["goto"]]!,
    uri: json["uri"],
    pic: json["pic"],
    pic43: json["pic_4_3"],
    title: json["title"],
    duration: json["duration"],
    pubdate: json["pubdate"],
    owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
    stat: json["stat"] == null ? null : Stat.fromJson(json["stat"]),
    avFeature: json["av_feature"],
    isFollowed: json["is_followed"],
    rcmdReason: json["rcmd_reason"] == null ? null : RcmdReason.fromJson(json["rcmd_reason"]),
    showInfo: json["show_info"],
    trackId: json["track_id"],
    pos: json["pos"],
    roomInfo: json["room_info"],
    ogvInfo: json["ogv_info"],
    businessInfo: json["business_info"],
    isStock: json["is_stock"],
    enableVt: json["enable_vt"],
    vtDisplay: json["vt_display"],
    dislikeSwitch: json["dislike_switch"],
    dislikeSwitchPc: json["dislike_switch_pc"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bvid": bvid,
    "cid": cid,
    "goto": gotoValues.reverse[goto],
    "uri": uri,
    "pic": pic,
    "pic_4_3": pic43,
    "title": title,
    "duration": duration,
    "pubdate": pubdate,
    "owner": owner?.toJson(),
    "stat": stat?.toJson(),
    "av_feature": avFeature,
    "is_followed": isFollowed,
    "rcmd_reason": rcmdReason?.toJson(),
    "show_info": showInfo,
    "track_id": trackId,
    "pos": pos,
    "room_info": roomInfo,
    "ogv_info": ogvInfo,
    "business_info": businessInfo,
    "is_stock": isStock,
    "enable_vt": enableVt,
    "vt_display": vtDisplay,
    "dislike_switch": dislikeSwitch,
    "dislike_switch_pc": dislikeSwitchPc,
  };
}

enum Goto {
  AV
}

final gotoValues = EnumValues({
  "av": Goto.AV
});

class Owner {
  int? mid;
  String? name;
  String? face;

  Owner({
    this.mid,
    this.name,
    this.face,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    mid: json["mid"],
    name: json["name"],
    face: json["face"],
  );

  Map<String, dynamic> toJson() => {
    "mid": mid,
    "name": name,
    "face": face,
  };
}

class RcmdReason {
  int? reasonType;
  String? content;

  RcmdReason({
    this.reasonType,
    this.content,
  });

  factory RcmdReason.fromJson(Map<String, dynamic> json) => RcmdReason(
    reasonType: json["reason_type"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "reason_type": reasonType,
    "content": content,
  };
}

class Stat {
  int? view;
  int? like;
  int? danmaku;
  int? vt;

  Stat({
    this.view,
    this.like,
    this.danmaku,
    this.vt,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    view: json["view"],
    like: json["like"],
    danmaku: json["danmaku"],
    vt: json["vt"],
  );

  Map<String, dynamic> toJson() => {
    "view": view,
    "like": like,
    "danmaku": danmaku,
    "vt": vt,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
