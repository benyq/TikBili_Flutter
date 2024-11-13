import 'package:json_annotation/json_annotation.dart';

part 'bilibili_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BiliBiliResponse<T> {
  final String message;
  final int code;
  final T? data;

  BiliBiliResponse({required this.message, required this.code, this.data});

  bool get isSuccess => code == 0;

  factory BiliBiliResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BiliBiliResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BiliBiliResponseToJson(this, toJsonT);

  bool isEmpty() {
    if(data == null) {
      return true;
    } else {
      if(data is List) {
        return (data as List).isEmpty;
      }
      return false;
    }
  }

  bool noMoreData({int pageSize = 0}) {
    if(data == null) {
      return true;
    } else {
      if(data is List) {
        return (data as List).length <= pageSize;
      }
      return false;
    }
  }
}