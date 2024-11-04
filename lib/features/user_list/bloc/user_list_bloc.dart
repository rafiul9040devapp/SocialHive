import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinity_list_comments/features/user_list/model/user_profile.dart';
import 'package:infinity_list_comments/repository/user/user_repository.dart';

part 'user_list_event.dart';

part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserRepository repository;

  UserListBloc({required this.repository}) : super(const UserListState()) {
    on<FetchUserProfileListEvent>(_onFetchingUserProfiles);
  }

  FutureOr<void> _onFetchingUserProfiles(
      FetchUserProfileListEvent event, Emitter<UserListState> emit) async {
    emit(state.copyWith(status: UserListStatus.loading));

    try {
      final response = await repository.fetchAllUsers();

      response.fold(
        (failure) => emit(state.copyWith(
            status: UserListStatus.failure, errorMessage: failure.toString())),
        (userList) {
          emit(state.copyWith(
              status: UserListStatus.success, profiles: userList));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          status: UserListStatus.failure, errorMessage: e.toString()));
    }
  }
}
