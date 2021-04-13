import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';


@JsonSerializable()
class Article extends Object {

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'errorCode')
  int? errorCode;

  @JsonKey(name: 'errorMsg')
  String? errorMsg;

  Article(this.data,this.errorCode,this.errorMsg,);

  factory Article.fromJson(Map<String, dynamic> srcJson) => _$ArticleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'curPage')
  int? curPage;

  @JsonKey(name: 'datas')
  List<Datas> datas;

  @JsonKey(name: 'offset')
  int? offset;

  @JsonKey(name: 'over')
  bool? over;

  @JsonKey(name: 'pageCount')
  int? pageCount;

  @JsonKey(name: 'size')
  int? size;

  @JsonKey(name: 'total')
  int? total;

  Data(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Datas extends Object {

  @JsonKey(name: 'apkLink')
  String? apkLink;

  @JsonKey(name: 'audit')
  int? audit;

  @JsonKey(name: 'author')
  String? author;

  @JsonKey(name: 'canEdit')
  bool? canEdit;

  @JsonKey(name: 'chapterId')
  int? chapterId;

  @JsonKey(name: 'chapterName')
  String? chapterName;

  @JsonKey(name: 'collect')
  bool? collect;

  @JsonKey(name: 'courseId')
  int? courseId;

  @JsonKey(name: 'desc')
  String? desc;

  @JsonKey(name: 'descMd')
  String? descMd;

  @JsonKey(name: 'envelopePic')
  String? envelopePic;

  @JsonKey(name: 'fresh')
  bool? fresh;

  @JsonKey(name: 'host')
  String? host;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'link')
  String? link;

  @JsonKey(name: 'niceDate')
  String? niceDate;

  @JsonKey(name: 'niceShareDate')
  String? niceShareDate;

  @JsonKey(name: 'origin')
  String? origin;

  @JsonKey(name: 'prefix')
  String? prefix;

  @JsonKey(name: 'projectLink')
  String? projectLink;

  @JsonKey(name: 'publishTime')
  int? publishTime;

  @JsonKey(name: 'realSuperChapterId')
  int? realSuperChapterId;

  @JsonKey(name: 'selfVisible')
  int? selfVisible;

  @JsonKey(name: 'shareDate')
  int? shareDate;

  @JsonKey(name: 'shareUser')
  String? shareUser;

  @JsonKey(name: 'superChapterId')
  int? superChapterId;

  @JsonKey(name: 'superChapterName')
  String? superChapterName;

  @JsonKey(name: 'tags')
  List<Tags> tags;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'userId')
  int? userId;

  @JsonKey(name: 'visible')
  int? visible;

  @JsonKey(name: 'zan')
  int? zan;

  Datas(this.apkLink,this.audit,this.author,this.canEdit,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.descMd,this.envelopePic,this.fresh,this.host,this.id,this.link,this.niceDate,this.niceShareDate,this.origin,this.prefix,this.projectLink,this.publishTime,this.realSuperChapterId,this.selfVisible,this.shareDate,this.shareUser,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,);

  factory Datas.fromJson(Map<String, dynamic> srcJson) => _$DatasFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DatasToJson(this);

}


@JsonSerializable()
class Tags extends Object {

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'url')
  String? url;

  Tags(this.name,this.url,);

  factory Tags.fromJson(Map<String, dynamic> srcJson) => _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);

}


