import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinity_list_comments/features/post_of_user/model/posts_of_user.dart';
import 'package:infinity_list_comments/repository/user/user_repository.dart';

part 'post_of_user_state.dart';

part 'post_of_user_event.dart';

class PostOfUserBloc extends Bloc<PostOfUserEvent, PostOfUserState> {
  final UserRepository repository;

  PostOfUserBloc({required this.repository}) : super(const PostOfUserState()) {
    on<FetchPostOfUserEvent>(_onFetchingPosts);
  }

  FutureOr<void> _onFetchingPosts(
      FetchPostOfUserEvent event, Emitter<PostOfUserState> emit) async {
    emit(state.copyWith(status: PostOfUserStatus.loading));

    try {
      final response =
          await repository.fetchPostsOfUser(event.profileId.toString());

      response.fold(
        (failure) => emit(state.copyWith(
            status: PostOfUserStatus.failure, errorMessage: failure.message)),
        (postList) => emit(state.copyWith(
            status: PostOfUserStatus.success, posts: postList)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: PostOfUserStatus.failure, errorMessage: e.toString()));
    }
  }
}
