import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner {

  String errorCode;
  String errorMsg;
  List<BannerItem> data;


  Banner(this.errorCode, this.errorMsg, this.data);

  factory Banner.fromJson(Map<String, dynamic> srcJson) =>
      _$BannerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}

@JsonSerializable()
class BannerItem {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  BannerItem(this.desc, this.id, this.imagePath, this.isVisible, this.order,
      this.title, this.type, this.url);

  factory BannerItem.fromJson(Map<String, dynamic> srcJson) =>
      _$BannerItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerItemToJson(this);
}
