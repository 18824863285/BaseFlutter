// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResult _$LogoutResultFromJson(Map<String, dynamic> json) {
  return LogoutResult(
    json['data'],
    json['errorCode'] as int?,
    json['errorMsg'] as String?,
  );
}

Map<String, dynamic> _$LogoutResultToJson(LogoutResult instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
