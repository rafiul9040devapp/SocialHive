import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/photos_of_user/model/photos_of_user.dart';
import 'package:infinity_list_comments/repository/user/user_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'photos_of_user_event.dart';

part 'photos_of_user_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDropper<E>(Duration duration) {
  return (event, mapper) {
    return droppable<E>().call(event.throttle(duration), mapper);
  };
}

class PhotosOfUserBloc extends Bloc<PhotosOfUserEvent, PhotosOfUserState> {
  final UserRepository repository;

  PhotosOfUserBloc({required this.repository})
      : super(const PhotosOfUserState()) {
    on<FetchAllPhotosOfUser>(
      _onFetchingPhotosOfUser,
      transformer: throttleDropper(throttleDuration),
    );
  }

  FutureOr<void> _onFetchingPhotosOfUser(
      FetchAllPhotosOfUser event, Emitter<PhotosOfUserState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == PhotoOfUserStatus.initial) {
        final response = await repository.fetchPhotosOfUser(event.profileId.toString());

        return response.fold(
              (failure) => emit(state.copyWith(
              status: PhotoOfUserStatus.failure, errorMessage: failure.message)),
              (photoList) => emit(state.copyWith(
              status: PhotoOfUserStatus.success,
              photos: photoList,
              hasReachedMax: photoList.isEmpty)),
        );
      }
      final fetchedPosts = await repository.fetchPhotosOfUser(event.profileId.toString(),state.photos.length);

      fetchedPosts.fold(
            (failure) => emit(state.copyWith(
            status: PhotoOfUserStatus.failure, errorMessage: failure.message)),
            (postList) => emit(
          postList.isEmpty
              ? state.copyWith(status: PhotoOfUserStatus.success,hasReachedMax: true)
              : state.copyWith(
              status: PhotoOfUserStatus.success,
              photos: List.of(state.photos)..addAll(postList),
              hasReachedMax: false),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: PhotoOfUserStatus.failure, errorMessage: e.toString()));
    }
  }
}
