// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'official_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficialAccount _$OfficialAccountFromJson(Map<String, dynamic> json) {
  return OfficialAccount(
    json['errorCode'] as int?,
    json['errorMsg'] as String?,
    (json['data'] as List<dynamic>)
        .map((e) => OfficialAccountItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OfficialAccountToJson(OfficialAccount instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data,
    };

OfficialAccountItem _$OfficialAccountItemFromJson(Map<String, dynamic> json) {
  return OfficialAccountItem(
    json['courseId'] as int?,
    json['id'] as int?,
    json['name'] as String?,
    json['order'] as int?,
    json['parentChapterId'] as int?,
    json['userControlSetTop'] as bool?,
    json['visible'] as int?,
  );
}

Map<String, dynamic> _$OfficialAccountItemToJson(
        OfficialAccountItem instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
