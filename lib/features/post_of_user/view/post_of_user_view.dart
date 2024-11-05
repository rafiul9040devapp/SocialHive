import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/post_of_user/bloc/post_of_user_bloc.dart';
import 'package:infinity_list_comments/features/post_of_user/view/components/post_of_user_item.dart';

import '../../../widgets/error_message_display.dart';

class PostOfUserView extends StatelessWidget {
  const PostOfUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostOfUserBloc, PostOfUserState>(
      builder: (context, state) {
       return switch(state.status){
         PostOfUserStatus.initial => const SizedBox(),
         PostOfUserStatus.loading => const Center(child: CircularProgressIndicator()),
         PostOfUserStatus.success => _buildSuccessContent(state),
         PostOfUserStatus.failure => ErrorMessageDisplay(message: state.errorMessage),
        };
      },
    );
  }

  Widget _buildSuccessContent(PostOfUserState state) {
    final response = state.posts;
    return response.isEmpty
        ? ErrorMessageDisplay(message: state.errorMessage)
        : PostOfUserItem(posts: response);
  }
}
