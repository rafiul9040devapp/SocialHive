part of 'comment_bloc.dart';

sealed class CommentEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class FetchCommentEvent extends CommentEvent{}