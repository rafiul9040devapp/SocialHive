import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_of_user.freezed.dart';
part 'posts_of_user.g.dart';

@freezed
class PostsOfUser with _$PostsOfUser {
  const factory PostsOfUser({
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'body') String? body,
  }) = _PostsOfUser;

  factory PostsOfUser.fromJson(Map<String, dynamic> json) =>
      _$PostsOfUserFromJson(json);
}
