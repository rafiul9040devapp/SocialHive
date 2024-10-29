import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_of_post.freezed.dart';
part 'comments_of_post.g.dart';

@freezed
class CommentsOfPost with _$CommentsOfPost {
  factory CommentsOfPost({
    @JsonKey(name: 'postId') int? postId,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'body') String? body,
  }) = _CommentsOfPost;

  factory CommentsOfPost.fromJson(Map<String, dynamic> json) => _$CommentsOfPostFromJson(json);
}
