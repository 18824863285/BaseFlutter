// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner(
    json['errorCode'] as int?,
    json['errorMsg'] as String?,
    (json['data'] as List<dynamic>)
        .map((e) => BannerItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data,
    };

BannerItem _$BannerItemFromJson(Map<String, dynamic> json) {
  return BannerItem(
    json['desc'] as String?,
    json['id'] as int?,
    json['imagePath'] as String?,
    json['isVisible'] as int?,
    json['order'] as int?,
    json['title'] as String?,
    json['type'] as int?,
    json['url'] as String?,
  );
}

Map<String, dynamic> _$BannerItemToJson(BannerItem instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
