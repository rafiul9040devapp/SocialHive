import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/post_details/bloc/post_details_bloc.dart';
import 'package:infinity_list_comments/features/post_details/view/post_details_view.dart';
import 'package:infinity_list_comments/route/app_routes.dart';
import 'package:infinity_list_comments/widgets/custom_app_bar.dart';

import '../../post/models/post.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;

  const PostDetailsPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      getIt<PostDetailsBloc>()
        ..add(GetPostDetailsEvent(post: post)),
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Post Details',
            hasBackButton: true,
            onBackButtonPressed: ()=> router.go(Routes.post.path()) ,
          ),
          body: const PostDetailsView(),
        ),
      ),
    );
  }
}
