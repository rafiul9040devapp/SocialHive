import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/post_details/bloc/post_details_bloc.dart';
import 'package:infinity_list_comments/widgets/error_message_display.dart';

import 'components/post_details.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      builder: (context, state) {
        switch (state.status) {
          case PostDetailsStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case PostDetailsStatus.success:
            final post = state.post;
            return PostDetails(post: post);
          case PostDetailsStatus.failure:
            return ErrorMessageDisplay(message: state.errorMessage);
        }
      },
    );
  }
}
