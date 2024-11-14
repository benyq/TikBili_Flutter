// To parse this JSON data, do
//
//     final videoReplyModel = videoReplyModelFromJson(jsonString);

import 'dart:convert';

VideoReplyModel videoReplyModelFromJson(String str) => VideoReplyModel.fromJson(json.decode(str));

String videoReplyModelToJson(VideoReplyModel data) => json.encode(data.toJson());

class VideoReplyModel {
  Page page;
  Config config;
  List<Reply> replies;
  List<dynamic> hots;
  Upper upper;
  dynamic top;
  dynamic notice;
  int vote;
  int blacklist;
  int assist;
  int mode;
  List<int> supportMode;
  Folder folder;
  dynamic lotteryCard;
  bool showBvid;
  Control control;

  VideoReplyModel({
    required this.page,
    required this.config,
    required this.replies,
    required this.hots,
    required this.upper,
    required this.top,
    required this.notice,
    required this.vote,
    required this.blacklist,
    required this.assist,
    required this.mode,
    required this.supportMode,
    required this.folder,
    required this.lotteryCard,
    required this.showBvid,
    required this.control,
  });

  factory VideoReplyModel.fromJson(Map<String, dynamic> json) => VideoReplyModel(
    page: Page.fromJson(json["page"]),
    config: Config.fromJson(json["config"]),
    replies: List<Reply>.from(json["replies"].map((x) => Reply.fromJson(x))),
    hots: List<dynamic>.from(json["hots"].map((x) => x)),
    upper: Upper.fromJson(json["upper"]),
    top: json["top"],
    notice: json["notice"],
    vote: json["vote"],
    blacklist: json["blacklist"],
    assist: json["assist"],
    mode: json["mode"],
    supportMode: List<int>.from(json["support_mode"].map((x) => x)),
    folder: Folder.fromJson(json["folder"]),
    lotteryCard: json["lottery_card"],
    showBvid: json["show_bvid"],
    control: Control.fromJson(json["control"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page.toJson(),
    "config": config.toJson(),
    "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
    "hots": List<dynamic>.from(hots.map((x) => x)),
    "upper": upper.toJson(),
    "top": top,
    "notice": notice,
    "vote": vote,
    "blacklist": blacklist,
    "assist": assist,
    "mode": mode,
    "support_mode": List<dynamic>.from(supportMode.map((x) => x)),
    "folder": folder.toJson(),
    "lottery_card": lotteryCard,
    "show_bvid": showBvid,
    "control": control.toJson(),
  };
}

class Config {
  int showadmin;
  int showentry;
  int showfloor;
  int showtopic;
  bool showUpFlag;
  bool readOnly;
  bool showDelLog;

  Config({
    required this.showadmin,
    required this.showentry,
    required this.showfloor,
    required this.showtopic,
    required this.showUpFlag,
    required this.readOnly,
    required this.showDelLog,
  });

  factory Config.fromJson(Map<String, dynamic> json) => Config(
    showadmin: json["showadmin"],
    showentry: json["showentry"],
    showfloor: json["showfloor"],
    showtopic: json["showtopic"],
    showUpFlag: json["show_up_flag"],
    readOnly: json["read_only"],
    showDelLog: json["show_del_log"],
  );

  Map<String, dynamic> toJson() => {
    "showadmin": showadmin,
    "showentry": showentry,
    "showfloor": showfloor,
    "showtopic": showtopic,
    "show_up_flag": showUpFlag,
    "read_only": readOnly,
    "show_del_log": showDelLog,
  };
}

class Control {
  bool inputDisable;
  String rootInputText;
  String childInputText;
  String giveupInputText;
  String bgText;
  bool webSelection;
  String answerGuideText;
  String answerGuideIconUrl;
  String answerGuideIosUrl;
  String answerGuideAndroidUrl;
  int showType;
  String showText;
  bool disableJumpEmote;

  Control({
    required this.inputDisable,
    required this.rootInputText,
    required this.childInputText,
    required this.giveupInputText,
    required this.bgText,
    required this.webSelection,
    required this.answerGuideText,
    required this.answerGuideIconUrl,
    required this.answerGuideIosUrl,
    required this.answerGuideAndroidUrl,
    required this.showType,
    required this.showText,
    required this.disableJumpEmote,
  });

  factory Control.fromJson(Map<String, dynamic> json) => Control(
    inputDisable: json["input_disable"],
    rootInputText: json["root_input_text"],
    childInputText: json["child_input_text"],
    giveupInputText: json["giveup_input_text"],
    bgText: json["bg_text"],
    webSelection: json["web_selection"],
    answerGuideText: json["answer_guide_text"],
    answerGuideIconUrl: json["answer_guide_icon_url"],
    answerGuideIosUrl: json["answer_guide_ios_url"],
    answerGuideAndroidUrl: json["answer_guide_android_url"],
    showType: json["show_type"],
    showText: json["show_text"],
    disableJumpEmote: json["disable_jump_emote"],
  );

  Map<String, dynamic> toJson() => {
    "input_disable": inputDisable,
    "root_input_text": rootInputText,
    "child_input_text": childInputText,
    "giveup_input_text": giveupInputText,
    "bg_text": bgText,
    "web_selection": webSelection,
    "answer_guide_text": answerGuideText,
    "answer_guide_icon_url": answerGuideIconUrl,
    "answer_guide_ios_url": answerGuideIosUrl,
    "answer_guide_android_url": answerGuideAndroidUrl,
    "show_type": showType,
    "show_text": showText,
    "disable_jump_emote": disableJumpEmote,
  };
}

class Folder {
  bool hasFolded;
  bool isFolded;
  String rule;

  Folder({
    required this.hasFolded,
    required this.isFolded,
    required this.rule,
  });

  factory Folder.fromJson(Map<String, dynamic> json) => Folder(
    hasFolded: json["has_folded"],
    isFolded: json["is_folded"],
    rule: json["rule"],
  );

  Map<String, dynamic> toJson() => {
    "has_folded": hasFolded,
    "is_folded": isFolded,
    "rule": rule,
  };
}

class Page {
  int num;
  int size;
  int count;
  int acount;

  Page({
    required this.num,
    required this.size,
    required this.count,
    required this.acount,
  });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    num: json["num"],
    size: json["size"],
    count: json["count"],
    acount: json["acount"],
  );

  Map<String, dynamic> toJson() => {
    "num": num,
    "size": size,
    "count": count,
    "acount": acount,
  };
}

class Reply {
  int rpid;
  int oid;
  int type;
  int mid;
  int root;
  int parent;
  int dialog;
  int count;
  int rcount;
  int state;
  int fansgrade;
  int attr;
  int ctime;
  String rpidStr;
  String rootStr;
  String parentStr;
  int like;
  int action;
  Member member;
  Content content;
  List<dynamic> replies;
  int assist;
  Folder folder;
  UpAction upAction;
  bool showFollow;
  bool invisible;
  ReplyControl replyControl;

  Reply({
    required this.rpid,
    required this.oid,
    required this.type,
    required this.mid,
    required this.root,
    required this.parent,
    required this.dialog,
    required this.count,
    required this.rcount,
    required this.state,
    required this.fansgrade,
    required this.attr,
    required this.ctime,
    required this.rpidStr,
    required this.rootStr,
    required this.parentStr,
    required this.like,
    required this.action,
    required this.member,
    required this.content,
    required this.replies,
    required this.assist,
    required this.folder,
    required this.upAction,
    required this.showFollow,
    required this.invisible,
    required this.replyControl,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
    rpid: json["rpid"],
    oid: json["oid"],
    type: json["type"],
    mid: json["mid"],
    root: json["root"],
    parent: json["parent"],
    dialog: json["dialog"],
    count: json["count"],
    rcount: json["rcount"],
    state: json["state"],
    fansgrade: json["fansgrade"],
    attr: json["attr"],
    ctime: json["ctime"],
    rpidStr: json["rpid_str"],
    rootStr: json["root_str"],
    parentStr: json["parent_str"],
    like: json["like"],
    action: json["action"],
    member: Member.fromJson(json["member"]),
    content: Content.fromJson(json["content"]),
    replies: List<dynamic>.from(json["replies"].map((x) => x)),
    assist: json["assist"],
    folder: Folder.fromJson(json["folder"]),
    upAction: UpAction.fromJson(json["up_action"]),
    showFollow: json["show_follow"],
    invisible: json["invisible"],
    replyControl: ReplyControl.fromJson(json["reply_control"]),
  );

  Map<String, dynamic> toJson() => {
    "rpid": rpid,
    "oid": oid,
    "type": type,
    "mid": mid,
    "root": root,
    "parent": parent,
    "dialog": dialog,
    "count": count,
    "rcount": rcount,
    "state": state,
    "fansgrade": fansgrade,
    "attr": attr,
    "ctime": ctime,
    "rpid_str": rpidStr,
    "root_str": rootStr,
    "parent_str": parentStr,
    "like": like,
    "action": action,
    "member": member.toJson(),
    "content": content.toJson(),
    "replies": List<dynamic>.from(replies.map((x) => x)),
    "assist": assist,
    "folder": folder.toJson(),
    "up_action": upAction.toJson(),
    "show_follow": showFollow,
    "invisible": invisible,
    "reply_control": replyControl.toJson(),
  };
}

class Content {
  String message;
  int plat;
  String device;
  List<dynamic> members;
  Map<String, Emote> emote;
  JumpUrl jumpUrl;
  int maxLine;

  Content({
    required this.message,
    required this.plat,
    required this.device,
    required this.members,
    required this.emote,
    required this.jumpUrl,
    required this.maxLine,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    message: json["message"],
    plat: json["plat"],
    device: json["device"],
    members: List<dynamic>.from(json["members"].map((x) => x)),
    emote: Map.from(json["emote"]).map((k, v) => MapEntry<String, Emote>(k, Emote.fromJson(v))),
    jumpUrl: JumpUrl.fromJson(json["jump_url"]),
    maxLine: json["max_line"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "plat": plat,
    "device": device,
    "members": List<dynamic>.from(members.map((x) => x)),
    "emote": Map.from(emote).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "jump_url": jumpUrl.toJson(),
    "max_line": maxLine,
  };
}

class Emote {
  int id;
  int packageId;
  int state;
  int type;
  int attr;
  String text;
  String url;
  Meta meta;
  int mtime;
  String jumpTitle;

  Emote({
    required this.id,
    required this.packageId,
    required this.state,
    required this.type,
    required this.attr,
    required this.text,
    required this.url,
    required this.meta,
    required this.mtime,
    required this.jumpTitle,
  });

  factory Emote.fromJson(Map<String, dynamic> json) => Emote(
    id: json["id"],
    packageId: json["package_id"],
    state: json["state"],
    type: json["type"],
    attr: json["attr"],
    text: json["text"],
    url: json["url"],
    meta: Meta.fromJson(json["meta"]),
    mtime: json["mtime"],
    jumpTitle: json["jump_title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "package_id": packageId,
    "state": state,
    "type": type,
    "attr": attr,
    "text": text,
    "url": url,
    "meta": meta.toJson(),
    "mtime": mtime,
    "jump_title": jumpTitle,
  };
}

class Meta {
  int size;

  Meta({
    required this.size,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "size": size,
  };
}

class JumpUrl {
  JumpUrl();

  factory JumpUrl.fromJson(Map<String, dynamic> json) => JumpUrl(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Member {
  String mid;
  String uname;
  String sex;
  String sign;
  String avatar;
  String rank;
  String displayRank;
  int faceNftNew;
  int isSeniorMember;
  LevelInfo levelInfo;
  MemberPendant pendant;
  Nameplate nameplate;
  OfficialVerify officialVerify;
  Vip vip;
  dynamic fansDetail;
  int following;
  int isFollowed;
  UserSailing userSailing;
  bool isContractor;
  String contractDesc;

  Member({
    required this.mid,
    required this.uname,
    required this.sex,
    required this.sign,
    required this.avatar,
    required this.rank,
    required this.displayRank,
    required this.faceNftNew,
    required this.isSeniorMember,
    required this.levelInfo,
    required this.pendant,
    required this.nameplate,
    required this.officialVerify,
    required this.vip,
    required this.fansDetail,
    required this.following,
    required this.isFollowed,
    required this.userSailing,
    required this.isContractor,
    required this.contractDesc,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    mid: json["mid"],
    uname: json["uname"],
    sex: json["sex"],
    sign: json["sign"],
    avatar: json["avatar"],
    rank: json["rank"],
    displayRank: json["DisplayRank"],
    faceNftNew: json["face_nft_new"],
    isSeniorMember: json["is_senior_member"],
    levelInfo: LevelInfo.fromJson(json["level_info"]),
    pendant: MemberPendant.fromJson(json["pendant"]),
    nameplate: Nameplate.fromJson(json["nameplate"]),
    officialVerify: OfficialVerify.fromJson(json["official_verify"]),
    vip: Vip.fromJson(json["vip"]),
    fansDetail: json["fans_detail"],
    following: json["following"],
    isFollowed: json["is_followed"],
    userSailing: UserSailing.fromJson(json["user_sailing"]),
    isContractor: json["is_contractor"],
    contractDesc: json["contract_desc"],
  );

  Map<String, dynamic> toJson() => {
    "mid": mid,
    "uname": uname,
    "sex": sex,
    "sign": sign,
    "avatar": avatar,
    "rank": rank,
    "DisplayRank": displayRank,
    "face_nft_new": faceNftNew,
    "is_senior_member": isSeniorMember,
    "level_info": levelInfo.toJson(),
    "pendant": pendant.toJson(),
    "nameplate": nameplate.toJson(),
    "official_verify": officialVerify.toJson(),
    "vip": vip.toJson(),
    "fans_detail": fansDetail,
    "following": following,
    "is_followed": isFollowed,
    "user_sailing": userSailing.toJson(),
    "is_contractor": isContractor,
    "contract_desc": contractDesc,
  };
}

class LevelInfo {
  int currentLevel;
  int currentMin;
  int currentExp;
  int nextExp;

  LevelInfo({
    required this.currentLevel,
    required this.currentMin,
    required this.currentExp,
    required this.nextExp,
  });

  factory LevelInfo.fromJson(Map<String, dynamic> json) => LevelInfo(
    currentLevel: json["current_level"],
    currentMin: json["current_min"],
    currentExp: json["current_exp"],
    nextExp: json["next_exp"],
  );

  Map<String, dynamic> toJson() => {
    "current_level": currentLevel,
    "current_min": currentMin,
    "current_exp": currentExp,
    "next_exp": nextExp,
  };
}

class Nameplate {
  int nid;
  String name;
  String image;
  String imageSmall;
  String level;
  String condition;

  Nameplate({
    required this.nid,
    required this.name,
    required this.image,
    required this.imageSmall,
    required this.level,
    required this.condition,
  });

  factory Nameplate.fromJson(Map<String, dynamic> json) => Nameplate(
    nid: json["nid"],
    name: json["name"],
    image: json["image"],
    imageSmall: json["image_small"],
    level: json["level"],
    condition: json["condition"],
  );

  Map<String, dynamic> toJson() => {
    "nid": nid,
    "name": name,
    "image": image,
    "image_small": imageSmall,
    "level": level,
    "condition": condition,
  };
}

class OfficialVerify {
  int type;
  String desc;

  OfficialVerify({
    required this.type,
    required this.desc,
  });

  factory OfficialVerify.fromJson(Map<String, dynamic> json) => OfficialVerify(
    type: json["type"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "desc": desc,
  };
}

class MemberPendant {
  int pid;
  String name;
  String image;
  int expire;
  String imageEnhance;
  String imageEnhanceFrame;

  MemberPendant({
    required this.pid,
    required this.name,
    required this.image,
    required this.expire,
    required this.imageEnhance,
    required this.imageEnhanceFrame,
  });

  factory MemberPendant.fromJson(Map<String, dynamic> json) => MemberPendant(
    pid: json["pid"],
    name: json["name"],
    image: json["image"],
    expire: json["expire"],
    imageEnhance: json["image_enhance"],
    imageEnhanceFrame: json["image_enhance_frame"],
  );

  Map<String, dynamic> toJson() => {
    "pid": pid,
    "name": name,
    "image": image,
    "expire": expire,
    "image_enhance": imageEnhance,
    "image_enhance_frame": imageEnhanceFrame,
  };
}

class UserSailing {
  UserSailingPendant pendant;
  Cardbg cardbg;
  dynamic cardbgWithFocus;

  UserSailing({
    required this.pendant,
    required this.cardbg,
    required this.cardbgWithFocus,
  });

  factory UserSailing.fromJson(Map<String, dynamic> json) => UserSailing(
    pendant: UserSailingPendant.fromJson(json["pendant"]),
    cardbg: Cardbg.fromJson(json["cardbg"]),
    cardbgWithFocus: json["cardbg_with_focus"],
  );

  Map<String, dynamic> toJson() => {
    "pendant": pendant.toJson(),
    "cardbg": cardbg.toJson(),
    "cardbg_with_focus": cardbgWithFocus,
  };
}

class Cardbg {
  int id;
  String name;
  String image;
  String jumpUrl;
  Fan fan;
  String type;

  Cardbg({
    required this.id,
    required this.name,
    required this.image,
    required this.jumpUrl,
    required this.fan,
    required this.type,
  });

  factory Cardbg.fromJson(Map<String, dynamic> json) => Cardbg(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    jumpUrl: json["jump_url"],
    fan: Fan.fromJson(json["fan"]),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "jump_url": jumpUrl,
    "fan": fan.toJson(),
    "type": type,
  };
}

class Fan {
  int isFan;
  int number;
  String color;
  String name;
  String numDesc;

  Fan({
    required this.isFan,
    required this.number,
    required this.color,
    required this.name,
    required this.numDesc,
  });

  factory Fan.fromJson(Map<String, dynamic> json) => Fan(
    isFan: json["is_fan"],
    number: json["number"],
    color: json["color"],
    name: json["name"],
    numDesc: json["num_desc"],
  );

  Map<String, dynamic> toJson() => {
    "is_fan": isFan,
    "number": number,
    "color": color,
    "name": name,
    "num_desc": numDesc,
  };
}

class UserSailingPendant {
  int id;
  String name;
  String image;
  String jumpUrl;
  String type;
  String imageEnhance;
  String imageEnhanceFrame;

  UserSailingPendant({
    required this.id,
    required this.name,
    required this.image,
    required this.jumpUrl,
    required this.type,
    required this.imageEnhance,
    required this.imageEnhanceFrame,
  });

  factory UserSailingPendant.fromJson(Map<String, dynamic> json) => UserSailingPendant(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    jumpUrl: json["jump_url"],
    type: json["type"],
    imageEnhance: json["image_enhance"],
    imageEnhanceFrame: json["image_enhance_frame"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "jump_url": jumpUrl,
    "type": type,
    "image_enhance": imageEnhance,
    "image_enhance_frame": imageEnhanceFrame,
  };
}

class Vip {
  int vipType;
  int vipDueDate;
  String dueRemark;
  int accessStatus;
  int vipStatus;
  String vipStatusWarn;
  int themeType;
  Label label;
  int avatarSubscript;
  String avatarSubscriptUrl;
  String nicknameColor;

  Vip({
    required this.vipType,
    required this.vipDueDate,
    required this.dueRemark,
    required this.accessStatus,
    required this.vipStatus,
    required this.vipStatusWarn,
    required this.themeType,
    required this.label,
    required this.avatarSubscript,
    required this.avatarSubscriptUrl,
    required this.nicknameColor,
  });

  factory Vip.fromJson(Map<String, dynamic> json) => Vip(
    vipType: json["vipType"],
    vipDueDate: json["vipDueDate"],
    dueRemark: json["dueRemark"],
    accessStatus: json["accessStatus"],
    vipStatus: json["vipStatus"],
    vipStatusWarn: json["vipStatusWarn"],
    themeType: json["themeType"],
    label: Label.fromJson(json["label"]),
    avatarSubscript: json["avatar_subscript"],
    avatarSubscriptUrl: json["avatar_subscript_url"],
    nicknameColor: json["nickname_color"],
  );

  Map<String, dynamic> toJson() => {
    "vipType": vipType,
    "vipDueDate": vipDueDate,
    "dueRemark": dueRemark,
    "accessStatus": accessStatus,
    "vipStatus": vipStatus,
    "vipStatusWarn": vipStatusWarn,
    "themeType": themeType,
    "label": label.toJson(),
    "avatar_subscript": avatarSubscript,
    "avatar_subscript_url": avatarSubscriptUrl,
    "nickname_color": nicknameColor,
  };
}

class Label {
  String path;
  String text;
  String labelTheme;
  String textColor;
  int bgStyle;
  String bgColor;
  String borderColor;

  Label({
    required this.path,
    required this.text,
    required this.labelTheme,
    required this.textColor,
    required this.bgStyle,
    required this.bgColor,
    required this.borderColor,
  });

  factory Label.fromJson(Map<String, dynamic> json) => Label(
    path: json["path"],
    text: json["text"],
    labelTheme: json["label_theme"],
    textColor: json["text_color"],
    bgStyle: json["bg_style"],
    bgColor: json["bg_color"],
    borderColor: json["border_color"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "text": text,
    "label_theme": labelTheme,
    "text_color": textColor,
    "bg_style": bgStyle,
    "bg_color": bgColor,
    "border_color": borderColor,
  };
}

class ReplyControl {
  String timeDesc;

  ReplyControl({
    required this.timeDesc,
  });

  factory ReplyControl.fromJson(Map<String, dynamic> json) => ReplyControl(
    timeDesc: json["time_desc"],
  );

  Map<String, dynamic> toJson() => {
    "time_desc": timeDesc,
  };
}

class UpAction {
  bool like;
  bool reply;

  UpAction({
    required this.like,
    required this.reply,
  });

  factory UpAction.fromJson(Map<String, dynamic> json) => UpAction(
    like: json["like"],
    reply: json["reply"],
  );

  Map<String, dynamic> toJson() => {
    "like": like,
    "reply": reply,
  };
}

class Upper {
  int mid;
  dynamic top;
  dynamic vote;

  Upper({
    required this.mid,
    required this.top,
    required this.vote,
  });

  factory Upper.fromJson(Map<String, dynamic> json) => Upper(
    mid: json["mid"],
    top: json["top"],
    vote: json["vote"],
  );

  Map<String, dynamic> toJson() => {
    "mid": mid,
    "top": top,
    "vote": vote,
  };
}
