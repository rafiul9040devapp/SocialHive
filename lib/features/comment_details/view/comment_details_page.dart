import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/comment/models/album.dart';
import 'package:infinity_list_comments/features/comment_details/bloc/comment_details_bloc.dart';
import 'package:infinity_list_comments/features/comment_details/view/comment_details_view.dart';
import 'package:infinity_list_comments/features/comment_details/view/components/comment_details_app_bar.dart';


class CommentDetailsPage extends StatelessWidget {
  final Album album;

  const CommentDetailsPage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CommentDetailsBloc>()
        ..add(GetCommentDetailsEvent(album: album)),
      child: const SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CommentDetailsAppBar(),
          ),
          body: CommentDetailsView(),
        ),
      ),
    );
  }
}
