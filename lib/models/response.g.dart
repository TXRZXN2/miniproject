// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseApi _$ResponseApiFromJson(Map<String, dynamic> json) => ResponseApi(
      total: json['total'] as String?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseApiToJson(ResponseApi instance) =>
    <String, dynamic>{
      'total': instance.total,
      'list': instance.list,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['id'] as String?,
      desc: json['short_desc'] as String?,
      type: json['type'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'short_desc': instance.desc,
      'type': instance.type,
      'image': instance.image,
    };
