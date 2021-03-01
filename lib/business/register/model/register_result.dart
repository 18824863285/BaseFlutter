

import 'package:json_annotation/json_annotation.dart';

part 'register_result.g.dart';


@JsonSerializable()
class RegisterResult{

  RegisterResult();

  factory RegisterResult.fromJson(Map<String, dynamic> srcJson) =>
      _$RegisterResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RegisterResultToJson(this);
}