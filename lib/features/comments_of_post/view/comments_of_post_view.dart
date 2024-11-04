import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/comments_of_post/bloc/comments_of_post_bloc.dart';
import 'package:infinity_list_comments/features/comments_of_post/view/components/comments_of_post_item.dart';

import '../../../widgets/error_message_display.dart';

class CommentsOfPostView extends StatelessWidget {
  const CommentsOfPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsOfPostBloc, CommentsOfPostState>(
      builder: (context, state) {
        return switch (state.status) {
          CommentsOfPostStatus.initial => const SizedBox(),
          CommentsOfPostStatus.loading =>
            const Center(child: CircularProgressIndicator()),
          CommentsOfPostStatus.success => _buildSuccessContent(state),
          CommentsOfPostStatus.failure =>
            ErrorMessageDisplay(message: state.errorMessage),
        };
      },
    );
  }

  Widget _buildSuccessContent(CommentsOfPostState state) {
    final response = state.comments;
    return response.isEmpty
        ? ErrorMessageDisplay(message: state.errorMessage)
        : CommentsOfPostItem(commentsOfPost: response);
  }
}
