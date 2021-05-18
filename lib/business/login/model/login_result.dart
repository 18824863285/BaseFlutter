import 'package:json_annotation/json_annotation.dart';

/**
 * {"data":{"admin":false,"chapterTops":[],"coinCount":0,"collectIds":[],"email":"","icon":"","id":88731,"nickname":"18824863285","password":"","publicName":"18824863285","token":"","type":0,"username":"18824863285"},"errorCode":0,"errorMsg":""}
 */
part 'login_result.g.dart';

@JsonSerializable()
class LoginResult {
  @JsonKey(name: 'data')
  Data? data;

  @JsonKey(name: 'errorCode')
  int? errorCode;

  @JsonKey(name: 'errorMsg')
  String? errorMsg;

  LoginResult(
    this.data,
    this.errorCode,
    this.errorMsg,
  );

  factory LoginResult.fromJson(Map<String, dynamic> srcJson) =>
      _$LoginResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'admin')
  bool? admin;

  @JsonKey(name: 'chapterTops')
  List<dynamic>? chapterTops;

  @JsonKey(name: 'coinCount')
  int? coinCount;

  @JsonKey(name: 'collectIds')
  List<dynamic>? collectIds;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'icon')
  String? icon;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'nickname')
  String? nickname;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'publicName')
  String? publicName;

  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'username')
  String? username;

  Data(
    this.admin,
    this.chapterTops,
    this.coinCount,
    this.collectIds,
    this.email,
    this.icon,
    this.id,
    this.nickname,
    this.password,
    this.publicName,
    this.token,
    this.type,
    this.username,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
