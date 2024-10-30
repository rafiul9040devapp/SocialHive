part of 'comment_details_bloc.dart';


sealed class CommentDetailsEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetCommentDetailsEvent extends CommentDetailsEvent{
  final Album album;
  GetCommentDetailsEvent({required this.album});

  @override
  List<Object?> get props => [album];
}