import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinity_list_comments/repository/comment_repository.dart';

import '../models/user.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final CommentRepository repository;

  UserBloc({required this.repository}) : super(const UserState()) {
    on<FetchUserEvent>(_onFetchUser);
  }

  FutureOr<void> _onFetchUser(
      FetchUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.initial));

    try {
      final response = await repository.fetchUserDio(event.userEmail);
      emit(
        response.fold(
          (failure) => state.copyWith(status: UserStatus.failure, errorMessage: failure.message),
          (user) => state.copyWith(status: UserStatus.success, userList: user),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: UserStatus.failure, errorMessage: e.toString()));
    }
  }
}
