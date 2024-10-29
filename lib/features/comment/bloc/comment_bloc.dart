import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';


import '../../../repository/comment/comment_repository.dart';
import '../models/album.dart';

part 'comment_event.dart';
part 'comments_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDropper<E>(Duration duration) {
  return (event, mapper) {
    return droppable<E>().call(event.throttle(duration), mapper);
  };
}

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository repository;

  CommentBloc({required this.repository}) : super(const CommentState()) {
    on<FetchCommentEvent>(
      _onFetched,
      transformer: throttleDropper(throttleDuration),
    );
  }

  FutureOr<void> _onFetched(
      FetchCommentEvent event, Emitter<CommentState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == CommentStatus.initial) {
        final response = await repository.fetchCommentsDio();
        return emit(
          response.fold(
            (failure) => state.copyWith(
                status: CommentStatus.failure, errorMessage: failure.message),
            (albumList) => state.copyWith(
                status: CommentStatus.success,
                albums: albumList,
                hasReachedMax: albumList.isEmpty),
          ),
        );
      }

      final fetchedComments =
          await repository.fetchCommentsDio(state.albums.length);
      fetchedComments.fold(
        (failure) => emit(state.copyWith(
            status: CommentStatus.failure, errorMessage: failure.message)),
        (albumList) => emit(
          albumList.isEmpty
              ? state.copyWith(hasReachedMax: true)
              : state.copyWith(
                  status: CommentStatus.success,
                  albums: List.of(state.albums)..addAll(albumList),
                  hasReachedMax: false),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: CommentStatus.failure, errorMessage: e.toString()));
    }
  }
}
