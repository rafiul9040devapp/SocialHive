part of 'comments_of_post_bloc.dart';

enum CommentsOfPostStatus { initial, loading, success, failure }

final class CommentsOfPostState extends Equatable {
  final CommentsOfPostStatus status;
  final List<CommentsOfPost> comments;
  final String errorMessage;

  const CommentsOfPostState({
    this.status = CommentsOfPostStatus.initial,
    this.comments = const <CommentsOfPost>[],
    this.errorMessage = '',
  });

  CommentsOfPostState copyWith({
    CommentsOfPostStatus? status,
    List<CommentsOfPost>? comments,
    String? errorMessage,
  }) {
    return CommentsOfPostState(
        status: status ?? this.status,
        comments: comments ?? this.comments,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [status,comments,errorMessage];
}
