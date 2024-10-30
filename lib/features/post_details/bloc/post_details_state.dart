part of 'post_details_bloc.dart';

enum PostDetailsStatus { loading, success, failure }

final class PostDetailsState extends Equatable {
  final PostDetailsStatus status;
  final Post post;
  final String errorMessage;

  const PostDetailsState({
    this.status = PostDetailsStatus.loading,
    this.post = const Post(userId: 0, id: 1, title: '',body: ''),
    this.errorMessage = '',
  });

  PostDetailsState copyWith({
    PostDetailsStatus? status,
    Post? post,
    String? errorMessage,
  }) {
    return PostDetailsState(
        status: status ?? this.status,
        post: post ?? this.post,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, post, errorMessage];
}
