import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/albums_of_user/model/albums_of_user.dart';
import 'package:infinity_list_comments/repository/user/user_repository.dart';

part 'albums_of_user_event.dart';

part 'albums_of_user_state.dart';

class AlbumsOfUserBloc extends Bloc<AlbumsOfUseEvent, AlbumsOfUserState> {
  final UserRepository repository;

  AlbumsOfUserBloc({required this.repository})
      : super(const AlbumsOfUserState()) {
    on<FetchAllAlbumsOfUserEvent>(_onFetchingAlbumsOfUser);
  }

  FutureOr<void> _onFetchingAlbumsOfUser(
      FetchAllAlbumsOfUserEvent event, Emitter<AlbumsOfUserState> emit) async {
    emit(state.copyWith(status: AlbumsOfUserStatus.loading));

    try {
      final response =
          await repository.fetchAlbumsOfUser(event.profileId.toString());

      response.fold(
          (failure) => emit(state.copyWith(
              status: AlbumsOfUserStatus.failure, error: failure.message)),
          (albumsOfUser) => emit(state.copyWith(
              status: AlbumsOfUserStatus.success, albums: albumsOfUser)));
    } catch (e) {
      emit(state.copyWith(
          status: AlbumsOfUserStatus.failure, error: e.toString()));
    }
  }
}
