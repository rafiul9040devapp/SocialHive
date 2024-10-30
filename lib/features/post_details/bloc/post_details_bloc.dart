import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinity_list_comments/features/comment_details/bloc/comment_details_bloc.dart';
import 'package:infinity_list_comments/features/post/models/post.dart';

part 'post_details_event.dart';

part 'post_details_state.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  PostDetailsBloc() : super(const PostDetailsState()) {
    on<GetPostDetailsEvent>(_onGettingPostDetails);
  }

  FutureOr<void> _onGettingPostDetails(
      GetPostDetailsEvent event, Emitter<PostDetailsState> emit) async {
    emit(state.copyWith(status: PostDetailsStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(status: PostDetailsStatus.success, post: event.post));
    } catch (_) {
      emit(state.copyWith(
          status: PostDetailsStatus.failure,
          errorMessage: 'Failed to load details'));
    }
  }
}
