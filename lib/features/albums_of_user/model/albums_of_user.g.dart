// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_of_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumsOfUserImpl _$$AlbumsOfUserImplFromJson(Map<String, dynamic> json) =>
    _$AlbumsOfUserImpl(
      userId: (json['userId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$AlbumsOfUserImplToJson(_$AlbumsOfUserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
    };
