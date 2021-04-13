import 'package:json_annotation/json_annotation.dart';

part 'official_account.g.dart';

@JsonSerializable()
class OfficialAccount {
  int? errorCode;
  String? errorMsg;
  List<OfficialAccountItem> data;

  OfficialAccount(this.errorCode, this.errorMsg, this.data);

  factory OfficialAccount.fromJson(Map<String, dynamic> srcJson) =>
      _$OfficialAccountFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OfficialAccountToJson(this);
}

@JsonSerializable()
class OfficialAccountItem {
  int? courseId;
  int? id;
  String? name;
  int? order;
  int? parentChapterId;
  bool? userControlSetTop;
  int? visible;

  OfficialAccountItem(this.courseId, this.id, this.name, this.order,
      this.parentChapterId, this.userControlSetTop, this.visible);

  factory OfficialAccountItem.fromJson(Map<String, dynamic> srcJson) =>
      _$OfficialAccountItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OfficialAccountItemToJson(this);
}
