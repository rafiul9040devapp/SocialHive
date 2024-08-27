import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';

import '../bloc/comment_bloc.dart';
import 'comment_view.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CommentBloc>(),
      child: const SafeArea(
        child: Scaffold(
          body: CommentView(),
        ),
      ),
    );
  }
}
