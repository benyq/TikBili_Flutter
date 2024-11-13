import 'dart:core';

class AccountModel {
  String birthday;
  int mid;
  bool nickFree;
  String rank;
  String sex;
  String sign;
  String uname;
  String userId;

  AccountModel({
    required this.birthday,
    required this.mid,
    required this.nickFree,
    required this.rank,
    required this.sex,
    required this.sign,
    required this.uname,
    required this.userId
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      AccountModel(
          birthday: json["birthday"],
          mid: json["mid"],
          nickFree: json["nick_free"],
          rank: json["rank"],
          sex: json["sex"],
          sign: json["sign"],
          uname: json["uname"],
          userId: json["userid"]
      );

  Map<String, dynamic> toJson() => {
    "birthday": birthday,
    "mid": mid,
    "nick_free": nickFree,
    "rank": rank,
    "sex": sex,
    "sign": sign,
    "uname": uname,
    "userid": userId
  };
}