import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/post_of_user/bloc/post_of_user_bloc.dart';
import 'package:infinity_list_comments/features/post_of_user/view/post_of_user_view.dart';

class PostOfUserPage extends StatelessWidget {
  final int profileId;

  const PostOfUserPage({super.key, required this.profileId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PostOfUserBloc>()
        ..add(FetchPostOfUserEvent(profileId: profileId)),
      child: const PostOfUserView(),
    );
  }
}
