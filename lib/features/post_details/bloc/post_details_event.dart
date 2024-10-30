part of 'post_details_bloc.dart';

sealed class PostDetailsEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetPostDetailsEvent extends PostDetailsEvent{
  final Post post;
  GetPostDetailsEvent({required this.post});

  @override
  List<Object?> get props => [post];
}