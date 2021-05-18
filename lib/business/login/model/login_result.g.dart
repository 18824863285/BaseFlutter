// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) {
  return LoginResult(
    json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    json['errorCode'] as int?,
    json['errorMsg'] as String?,
  );
}

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['admin'] as bool?,
    json['chapterTops'] as List<dynamic>?,
    json['coinCount'] as int?,
    json['collectIds'] as List<dynamic>?,
    json['email'] as String?,
    json['icon'] as String?,
    json['id'] as int?,
    json['nickname'] as String?,
    json['password'] as String?,
    json['publicName'] as String?,
    json['token'] as String?,
    json['type'] as int?,
    json['username'] as String?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'admin': instance.admin,
      'chapterTops': instance.chapterTops,
      'coinCount': instance.coinCount,
      'collectIds': instance.collectIds,
      'email': instance.email,
      'icon': instance.icon,
      'id': instance.id,
      'nickname': instance.nickname,
      'password': instance.password,
      'publicName': instance.publicName,
      'token': instance.token,
      'type': instance.type,
      'username': instance.username,
    };
