import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:infinity_list_comments/features/post/models/post.dart';
import 'package:infinity_list_comments/repository/post/post_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'post_state.dart';

part 'post_event.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDropper<E>(Duration duration) {
  return (event, mapper) {
    return droppable<E>().call(event.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc({required this.repository}) : super(const PostState()) {
    on<FetchPostEvent>(
      _onFetched,
      transformer: throttleDropper(throttleDuration),
    );
  }

  FutureOr<void> _onFetched(
      FetchPostEvent event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == PostStatus.initial) {
        final response = await repository.fetchPost();

        return response.fold(
          (failure) => emit(state.copyWith(
              status: PostStatus.failure, errorMessage: failure.message)),
          (postList) => emit(state.copyWith(
              status: PostStatus.success,
              posts: postList,
              hasReachedMax: postList.isEmpty)),
        );
      }

      final fetchedPosts = await repository.fetchPost(state.posts.length);

      fetchedPosts.fold(
        (failure) => emit(state.copyWith(
            status: PostStatus.failure, errorMessage: failure.message)),
        (postList) => emit(
          postList.isEmpty
              ? state.copyWith(hasReachedMax: true)
              : state.copyWith(
                  status: PostStatus.success,
                  posts: List.of(state.posts)..addAll(postList),
                  hasReachedMax: false),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: PostStatus.failure, errorMessage: e.toString()));
    }
  }
}
