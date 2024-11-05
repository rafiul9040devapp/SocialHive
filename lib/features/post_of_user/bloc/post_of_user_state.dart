part of 'post_of_user_bloc.dart';

enum PostOfUserStatus { initial, loading, success, failure }

final class PostOfUserState extends Equatable {
  final PostOfUserStatus status;
  final List<PostsOfUser> posts;
  final String errorMessage;

  const PostOfUserState({
    this.status = PostOfUserStatus.initial,
    this.posts = const <PostsOfUser>[],
    this.errorMessage = '',
  });

  PostOfUserState copyWith({
    PostOfUserStatus? status,
    List<PostsOfUser>? posts,
    String? errorMessage,
  }) {
    return PostOfUserState(
        status: status ?? this.status,
        posts: posts ?? this.posts,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [status,posts,errorMessage];
}
