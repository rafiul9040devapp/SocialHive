// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_of_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentsOfPostImpl _$$CommentsOfPostImplFromJson(Map<String, dynamic> json) =>
    _$CommentsOfPostImpl(
      postId: (json['postId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$$CommentsOfPostImplToJson(
        _$CommentsOfPostImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
