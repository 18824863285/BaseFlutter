import 'package:json_annotation/json_annotation.dart';

part 'hot_key.g.dart';

@JsonSerializable()
class HotKey {
  int errorCode;

  String errorMsg;

  List<HotKeyItem> data;

  HotKey(this.errorCode, this.errorMsg, this.data);

  factory HotKey.fromJson(Map<String, dynamic> srcJson) =>
      _$HotKeyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotKeyToJson(this);
}

@JsonSerializable()
class HotKeyItem {
  int id;
  String link;
  String name;
  int order;
  int visible;

  HotKeyItem(this.id, this.link, this.name, this.order, this.visible);

  factory HotKeyItem.fromJson(Map<String, dynamic> srcJson) =>
      _$HotKeyItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotKeyItemToJson(this);
}
