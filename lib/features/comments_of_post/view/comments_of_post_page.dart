import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/comments_of_post/bloc/comments_of_post_bloc.dart';
import 'package:infinity_list_comments/features/comments_of_post/view/comments_of_post_view.dart';
import 'package:infinity_list_comments/route/app_routes.dart';
import 'package:infinity_list_comments/widgets/custom_app_bar.dart';

import '../../../di/service_locator.dart';
import '../../connectivity/bloc/connectivity_bloc.dart';
import '../../connectivity/view/components/no_internet_connection.dart';

class CommentsOfPostPage extends StatelessWidget {
  final int postId;

  const CommentsOfPostPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ConnectivityBloc>()),
        BlocProvider(
            create: (_) => getIt<CommentsOfPostBloc>()
              ..add(FetchCommentsOfPostEvent(postId: postId))),
      ],
      child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          switch (state.connectionStatus) {
            case ConnectionStatus.initial:
              return const Scaffold(body: SizedBox());
            case ConnectionStatus.connected:
              return Scaffold(
                appBar: CustomAppBar(
                  title: 'Comments',
                  hasBackButton: true,
                  onBackButtonPressed: () => router.go(Routes.post.path()),
                ),
                body: const CommentsOfPostView(),
              );
            case ConnectionStatus.disconnected:
              return Scaffold(
                  body: NoInternetConnection(
                      message: state.message ?? 'No Internet Connection'));
          }
        },
      ),
    );
  }
}
