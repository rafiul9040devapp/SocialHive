import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/comments_of_post/bloc/comments_of_post_bloc.dart';

import '../../../widgets/error_message_display.dart';

class CommentsOfPostView extends StatelessWidget {
  const CommentsOfPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsOfPostBloc, CommentsOfPostState>(
      builder: (context, state) {
        switch (state.status) {
          case CommentsOfPostStatus.initial:
            return const SizedBox();
          case CommentsOfPostStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case CommentsOfPostStatus.success:
            return ListView.builder(
              itemCount: state.comments.length,
                itemBuilder: (context, index) {
              final comment = state.comments[index];
              return Text(comment.name ?? '');
            },);
          case CommentsOfPostStatus.failure:
            return ErrorMessageDisplay(message: state.errorMessage);
        }
      },
    );
  }
}
