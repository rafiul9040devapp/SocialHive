part of 'comments_of_post_bloc.dart';


sealed class CommentsOfPostEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class FetchCommentsOfPostEvent extends CommentsOfPostEvent{
  final int postId;
  FetchCommentsOfPostEvent({required this.postId});
  @override
  List<Object?> get props => [postId];
}