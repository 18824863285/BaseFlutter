import 'package:json_annotation/json_annotation.dart';

part 'register_result.g.dart';

@JsonSerializable()
class RegisterResult {
  RegisterResultData data;
  int errorCode;
  String errorMsg;

  RegisterResult();

  factory RegisterResult.fromJson(Map<String, dynamic> srcJson) =>
      _$RegisterResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RegisterResultToJson(this);
}

@JsonSerializable()
class RegisterResultData {
  bool admin;
  List<dynamic> chapterTops;
  int coinCount;
  List<dynamic> collectIds;
  String email;
  String icon;
  int id;
  String nickname;
  String password;
  String publicName;
  String token;
  int type;
  String username;

  factory RegisterResultData.fromJson(Map<String, dynamic> srcJson) =>
      _$RegisterResultDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RegisterResultDataToJson(this);

  RegisterResultData();
}
