import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class ResponseApi {
  @JsonKey(name: "total")
  String? total;
  @JsonKey(name: "list")
  List<Article>? list;

  ResponseApi({
    this.total,
    this.list,
  });

  factory ResponseApi.fromJson(Map<String, dynamic> json) =>
      _$ResponseApiFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseApiToJson(this);
}

@JsonSerializable()
class Article {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "short_desc")
  String? desc;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "image")
  String? image;

  Article({
    this.id,
    this.desc,
    this.type,
    this.image,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
