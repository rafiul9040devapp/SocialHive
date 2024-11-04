import 'package:freezed_annotation/freezed_annotation.dart';

part 'photos_of_user.freezed.dart';
part 'photos_of_user.g.dart';

@freezed
class PhotosOfUser with _$PhotosOfUser {
  const factory PhotosOfUser({
    @JsonKey(name: 'albumId') int? albumId,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'thumbnailUrl') String? thumbnailUrl,
  }) = _PhotosOfUser;

  factory PhotosOfUser.fromJson(Map<String, dynamic> json) =>
      _$PhotosOfUserFromJson(json);
}
