import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinity_list_comments/features/comments_of_post/models/comments_of_post.dart';
import 'package:infinity_list_comments/repository/post/post_repository.dart';

part 'comments_of_post_event.dart';

part 'comments_of_post_state.dart';

class CommentsOfPostBloc
    extends Bloc<CommentsOfPostEvent, CommentsOfPostState> {
  final PostRepository repository;

  CommentsOfPostBloc({required this.repository})
      : super(const CommentsOfPostState()) {
    on<FetchCommentsOfPostEvent>(_onFetched);
  }

  FutureOr<void> _onFetched(
      FetchCommentsOfPostEvent event, Emitter<CommentsOfPostState> emit) async {
    emit(state.copyWith(status: CommentsOfPostStatus.loading));

    try {
      final response = await repository.fetchCommentsOfPost(event.postId);

      response.fold(
        (failure) => emit(state.copyWith(
            status: CommentsOfPostStatus.failure,
            errorMessage: failure.message)),
        (commentsOfPostList) => emit(state.copyWith(
            status: CommentsOfPostStatus.success,
            comments: commentsOfPostList)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: CommentsOfPostStatus.failure, errorMessage: e.toString()));
    }
  }
}
