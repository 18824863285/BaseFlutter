// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Knowledge _$KnowledgeFromJson(Map<String, dynamic> json) {
  return Knowledge(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
    errorCode: json['errorCode'] as int?,
    errorMsg: json['errorMsg'] as String?,
  );
}

Map<String, dynamic> _$KnowledgeToJson(Knowledge instance) => <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => Children.fromJson(e as Map<String, dynamic>))
        .toList(),
    courseId: json['courseId'] as int?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    order: json['order'] as int?,
    parentChapterId: json['parentChapterId'] as int?,
    userControlSetTop: json['userControlSetTop'] as bool?,
    visible: json['visible'] as int?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) {
  return Children(
    courseId: json['courseId'] as int?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    order: json['order'] as int?,
    parentChapterId: json['parentChapterId'] as int?,
    userControlSetTop: json['userControlSetTop'] as bool?,
    visible: json['visible'] as int?,
  );
}

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
