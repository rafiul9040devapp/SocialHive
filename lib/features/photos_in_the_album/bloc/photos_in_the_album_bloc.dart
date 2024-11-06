import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:infinity_list_comments/features/photos_of_user/model/photos_of_user.dart';
import 'package:infinity_list_comments/repository/user/user_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'photos_in_the_album_event.dart';
part 'photos_in_the_album_state.dart';


const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDropper<E>(Duration duration) {
  return (event, mapper) {
    return droppable<E>().call(event.throttle(duration), mapper);
  };
}


class PhotosInTheAlbumBloc extends Bloc<PhotosInTheAlbumEvent,PhotosInTheAlbumState>{

  final UserRepository repository;

  PhotosInTheAlbumBloc({required this.repository}) : super(const PhotosInTheAlbumState()){
    on<FetchPhotosFromAlbumEvent>(
      _onFetched,
      transformer: throttleDropper(throttleDuration),
    );
  }



  FutureOr<void> _onFetched(FetchPhotosFromAlbumEvent event, Emitter<PhotosInTheAlbumState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == PhotosInTheAlbumStatus.initial) {
        final response = await repository.fetchPhotosFromAlbumOfUser(event.albumId.toString());

        return response.fold(
              (failure) => emit(state.copyWith(
              status: PhotosInTheAlbumStatus.failure, errorMessage: failure.message)),
              (photos) => emit(state.copyWith(
              status: PhotosInTheAlbumStatus.success,
              photos: photos,
              hasReachedMax: photos.isEmpty)),
        );
      }

      final fetchedPosts = await repository.fetchPhotosFromAlbumOfUser(event.albumId.toString(),state.photos.length);

      fetchedPosts.fold(
            (failure) => emit(state.copyWith(
            status: PhotosInTheAlbumStatus.failure, errorMessage: failure.message)),
            (photos) => emit(
          photos.isEmpty
              ? state.copyWith(hasReachedMax: true)
              : state.copyWith(
              status: PhotosInTheAlbumStatus.success,
              photos: List.of(state.photos)..addAll(photos),
              hasReachedMax: false),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: PhotosInTheAlbumStatus.failure, errorMessage: e.toString()));
    }

  }
}