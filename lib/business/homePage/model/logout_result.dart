import 'package:json_annotation/json_annotation.dart';

part 'logout_result.g.dart';

@JsonSerializable()
class LogoutResult {
  Object data;
  int errorCode;
  String errorMsg;

  LogoutResult(this.data, this.errorCode, this.errorMsg);

  factory LogoutResult.fromJson(Map<String, dynamic> srcJson) =>
      _$LogoutResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LogoutResultToJson(this);
}
