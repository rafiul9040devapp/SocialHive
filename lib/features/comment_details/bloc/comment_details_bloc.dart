import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinity_list_comments/features/comment/models/album.dart';

part 'comment_details_state.dart';

part 'comment_details_event.dart';

class CommentDetailsBloc
    extends Bloc<CommentDetailsEvent, CommentDetailsState> {
  CommentDetailsBloc() : super(const CommentDetailsState()) {
    on<GetCommentDetailsEvent>(_onGetCommentDetails);
  }


  FutureOr<void> _onGetCommentDetails(GetCommentDetailsEvent event,
      Emitter<CommentDetailsState> emit) async {
    emit(state.copyWith(status: CommentDetailsStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(
          status: CommentDetailsStatus.success, album: event.album));
    } catch (_) {
      emit(state.copyWith(status: CommentDetailsStatus.failure,
          errorMessage: 'Failed to load details'));
    }
  }
}