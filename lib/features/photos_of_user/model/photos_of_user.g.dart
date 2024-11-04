// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_of_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotosOfUserImpl _$$PhotosOfUserImplFromJson(Map<String, dynamic> json) =>
    _$PhotosOfUserImpl(
      albumId: (json['albumId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$$PhotosOfUserImplToJson(_$PhotosOfUserImpl instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
