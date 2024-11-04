// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_of_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostsOfUserImpl _$$PostsOfUserImplFromJson(Map<String, dynamic> json) =>
    _$PostsOfUserImpl(
      userId: (json['userId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$$PostsOfUserImplToJson(_$PostsOfUserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
