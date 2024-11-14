// To parse this JSON data, do
//
//     final videoInfoModel = videoInfoModelFromJson(jsonString);

import 'dart:convert';

VideoInfoModel videoInfoModelFromJson(String str) => VideoInfoModel.fromJson(json.decode(str));

String videoInfoModelToJson(VideoInfoModel data) => json.encode(data.toJson());

class VideoInfoModel {
  String bvid;
  int aid;
  int videos;
  int tid;
  String tname;
  int copyright;
  String pic;
  String title;
  int pubdate;
  int ctime;
  String desc;
  List<DescV2>? descV2;
  int state;
  int duration;
  Map<String, int> rights;
  Owner owner;
  Stat stat;
  ArgueInfo argueInfo;
  String videoInfoModelDynamic;
  int cid;
  Dimension dimension;
  dynamic premiere;
  int teenageMode;
  bool isChargeableSeason;
  bool isStory;
  bool isUpowerExclusive;
  bool isUpowerPlay;
  bool isUpowerPreview;
  int enableVt;
  String vtDisplay;
  bool noCache;
  List<Page> pages;
  Subtitle subtitle;
  bool isSeasonDisplay;
  UserGarb userGarb;
  HonorReply honorReply;
  String likeIcon;
  bool needJumpBv;
  bool disableShowUpInfo;
  int isStoryPlay;
  bool isViewSelf;

  VideoInfoModel({
    required this.bvid,
    required this.aid,
    required this.videos,
    required this.tid,
    required this.tname,
    required this.copyright,
    required this.pic,
    required this.title,
    required this.pubdate,
    required this.ctime,
    required this.desc,
    required this.descV2,
    required this.state,
    required this.duration,
    required this.rights,
    required this.owner,
    required this.stat,
    required this.argueInfo,
    required this.videoInfoModelDynamic,
    required this.cid,
    required this.dimension,
    required this.premiere,
    required this.teenageMode,
    required this.isChargeableSeason,
    required this.isStory,
    required this.isUpowerExclusive,
    required this.isUpowerPlay,
    required this.isUpowerPreview,
    required this.enableVt,
    required this.vtDisplay,
    required this.noCache,
    required this.pages,
    required this.subtitle,
    required this.isSeasonDisplay,
    required this.userGarb,
    required this.honorReply,
    required this.likeIcon,
    required this.needJumpBv,
    required this.disableShowUpInfo,
    required this.isStoryPlay,
    required this.isViewSelf,
  });

  factory VideoInfoModel.fromJson(Map<String, dynamic> json) => VideoInfoModel(
    bvid: json["bvid"],
    aid: json["aid"],
    videos: json["videos"],
    tid: json["tid"],
    tname: json["tname"],
    copyright: json["copyright"],
    pic: json["pic"],
    title: json["title"],
    pubdate: json["pubdate"],
    ctime: json["ctime"],
    desc: json["desc"],
    descV2: json.containsKey("desc_v2") && json["desc_v2"] != null ? List<DescV2>.from(json["desc_v2"].map((x) => DescV2.fromJson(x))) : null,
    state: json["state"],
    duration: json["duration"],
    rights: Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
    owner: Owner.fromJson(json["owner"]),
    stat: Stat.fromJson(json["stat"]),
    argueInfo: ArgueInfo.fromJson(json["argue_info"]),
    videoInfoModelDynamic: json["dynamic"],
    cid: json["cid"],
    dimension: Dimension.fromJson(json["dimension"]),
    premiere: json["premiere"],
    teenageMode: json["teenage_mode"],
    isChargeableSeason: json["is_chargeable_season"],
    isStory: json["is_story"],
    isUpowerExclusive: json["is_upower_exclusive"],
    isUpowerPlay: json["is_upower_play"],
    isUpowerPreview: json["is_upower_preview"],
    enableVt: json["enable_vt"],
    vtDisplay: json["vt_display"],
    noCache: json["no_cache"],
    pages: List<Page>.from(json["pages"].map((x) => Page.fromJson(x))),
    subtitle: Subtitle.fromJson(json["subtitle"]),
    isSeasonDisplay: json["is_season_display"],
    userGarb: UserGarb.fromJson(json["user_garb"]),
    honorReply: HonorReply.fromJson(json["honor_reply"]),
    likeIcon: json["like_icon"],
    needJumpBv: json["need_jump_bv"],
    disableShowUpInfo: json["disable_show_up_info"],
    isStoryPlay: json["is_story_play"],
    isViewSelf: json["is_view_self"],
  );

  Map<String, dynamic> toJson() => {
    "bvid": bvid,
    "aid": aid,
    "videos": videos,
    "tid": tid,
    "tname": tname,
    "copyright": copyright,
    "pic": pic,
    "title": title,
    "pubdate": pubdate,
    "ctime": ctime,
    "desc": desc,
    "desc_v2": descV2 == null ? null : List<dynamic>.from(descV2!.map((x) => x.toJson())),
    "state": state,
    "duration": duration,
    "rights": Map.from(rights).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "owner": owner.toJson(),
    "stat": stat.toJson(),
    "argue_info": argueInfo.toJson(),
    "dynamic": videoInfoModelDynamic,
    "cid": cid,
    "dimension": dimension.toJson(),
    "premiere": premiere,
    "teenage_mode": teenageMode,
    "is_chargeable_season": isChargeableSeason,
    "is_story": isStory,
    "is_upower_exclusive": isUpowerExclusive,
    "is_upower_play": isUpowerPlay,
    "is_upower_preview": isUpowerPreview,
    "enable_vt": enableVt,
    "vt_display": vtDisplay,
    "no_cache": noCache,
    "pages": List<dynamic>.from(pages.map((x) => x.toJson())),
    "subtitle": subtitle.toJson(),
    "is_season_display": isSeasonDisplay,
    "user_garb": userGarb.toJson(),
    "honor_reply": honorReply.toJson(),
    "like_icon": likeIcon,
    "need_jump_bv": needJumpBv,
    "disable_show_up_info": disableShowUpInfo,
    "is_story_play": isStoryPlay,
    "is_view_self": isViewSelf,
  };
}

class ArgueInfo {
  String argueMsg;
  int argueType;
  String argueLink;

  ArgueInfo({
    required this.argueMsg,
    required this.argueType,
    required this.argueLink,
  });

  factory ArgueInfo.fromJson(Map<String, dynamic> json) => ArgueInfo(
    argueMsg: json["argue_msg"],
    argueType: json["argue_type"],
    argueLink: json["argue_link"],
  );

  Map<String, dynamic> toJson() => {
    "argue_msg": argueMsg,
    "argue_type": argueType,
    "argue_link": argueLink,
  };
}

class DescV2 {
  String rawText;
  int type;
  int bizId;

  DescV2({
    required this.rawText,
    required this.type,
    required this.bizId,
  });

  factory DescV2.fromJson(Map<String, dynamic> json) => DescV2(
    rawText: json["raw_text"],
    type: json["type"],
    bizId: json["biz_id"],
  );

  Map<String, dynamic> toJson() => {
    "raw_text": rawText,
    "type": type,
    "biz_id": bizId,
  };
}

class Dimension {
  int width;
  int height;
  int rotate;

  Dimension({
    required this.width,
    required this.height,
    required this.rotate,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) => Dimension(
    width: json["width"],
    height: json["height"],
    rotate: json["rotate"],
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "rotate": rotate,
  };
}

class HonorReply {
  HonorReply();

  factory HonorReply.fromJson(Map<String, dynamic> json) => HonorReply(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Owner {
  int mid;
  String name;
  String face;

  Owner({
    required this.mid,
    required this.name,
    required this.face,
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

class Page {
  int cid;
  int page;
  String from;
  String pagePart;
  int duration;
  String vid;
  String weblink;
  Dimension dimension;
  String firstFrame;

  Page({
    required this.cid,
    required this.page,
    required this.from,
    required this.pagePart,
    required this.duration,
    required this.vid,
    required this.weblink,
    required this.dimension,
    required this.firstFrame,
  });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    cid: json["cid"],
    page: json["page"],
    from: json["from"],
    pagePart: json["part"],
    duration: json["duration"],
    vid: json["vid"],
    weblink: json["weblink"],
    dimension: Dimension.fromJson(json["dimension"]),
    firstFrame: json["first_frame"],
  );

  Map<String, dynamic> toJson() => {
    "cid": cid,
    "page": page,
    "from": from,
    "part": pagePart,
    "duration": duration,
    "vid": vid,
    "weblink": weblink,
    "dimension": dimension.toJson(),
    "first_frame": firstFrame,
  };
}

class Stat {
  int aid;
  int view;
  int danmaku;
  int reply;
  int favorite;
  int coin;
  int share;
  int nowRank;
  int hisRank;
  int like;
  int dislike;
  String evaluation;
  int vt;

  Stat({
    required this.aid,
    required this.view,
    required this.danmaku,
    required this.reply,
    required this.favorite,
    required this.coin,
    required this.share,
    required this.nowRank,
    required this.hisRank,
    required this.like,
    required this.dislike,
    required this.evaluation,
    required this.vt,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    aid: json["aid"],
    view: json["view"],
    danmaku: json["danmaku"],
    reply: json["reply"],
    favorite: json["favorite"],
    coin: json["coin"],
    share: json["share"],
    nowRank: json["now_rank"],
    hisRank: json["his_rank"],
    like: json["like"],
    dislike: json["dislike"],
    evaluation: json["evaluation"],
    vt: json["vt"],
  );

  Map<String, dynamic> toJson() => {
    "aid": aid,
    "view": view,
    "danmaku": danmaku,
    "reply": reply,
    "favorite": favorite,
    "coin": coin,
    "share": share,
    "now_rank": nowRank,
    "his_rank": hisRank,
    "like": like,
    "dislike": dislike,
    "evaluation": evaluation,
    "vt": vt,
  };
}

class Subtitle {
  bool allowSubmit;
  List<dynamic> list;

  Subtitle({
    required this.allowSubmit,
    required this.list,
  });

  factory Subtitle.fromJson(Map<String, dynamic> json) => Subtitle(
    allowSubmit: json["allow_submit"],
    list: List<dynamic>.from(json["list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "allow_submit": allowSubmit,
    "list": List<dynamic>.from(list.map((x) => x)),
  };
}

class UserGarb {
  String urlImageAniCut;

  UserGarb({
    required this.urlImageAniCut,
  });

  factory UserGarb.fromJson(Map<String, dynamic> json) => UserGarb(
    urlImageAniCut: json["url_image_ani_cut"],
  );

  Map<String, dynamic> toJson() => {
    "url_image_ani_cut": urlImageAniCut,
  };
}
