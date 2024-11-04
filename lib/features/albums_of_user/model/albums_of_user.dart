import 'package:freezed_annotation/freezed_annotation.dart';

part 'albums_of_user.freezed.dart';
part 'albums_of_user.g.dart';

@freezed
class AlbumsOfUser with _$AlbumsOfUser {
  const factory AlbumsOfUser({
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
  }) = _AlbumsOfUser;

  factory AlbumsOfUser.fromJson(Map<String, dynamic> json) =>
      _$AlbumsOfUserFromJson(json);
}
