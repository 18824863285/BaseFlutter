// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotKey _$HotKeyFromJson(Map<String, dynamic> json) {
  return HotKey(
    json['errorCode'] as int,
    json['errorMsg'] as String,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : HotKeyItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HotKeyToJson(HotKey instance) => <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data,
    };

HotKeyItem _$HotKeyItemFromJson(Map<String, dynamic> json) {
  return HotKeyItem(
    json['id'] as int,
    json['link'] as String,
    json['name'] as String,
    json['order'] as int,
    json['visible'] as int,
  );
}

Map<String, dynamic> _$HotKeyItemToJson(HotKeyItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
