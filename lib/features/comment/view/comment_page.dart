import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/comment/view/components/comment_app_bar.dart';
import 'package:infinity_list_comments/features/connectivity/bloc/connectivity_bloc.dart';

import '../../connectivity/view/components/no_internet_connection.dart';
import '../bloc/comment_bloc.dart';
import 'comment_view.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CommentBloc>()),
        BlocProvider(create: (_) => getIt<ConnectivityBloc>()),
      ],
      child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          if (state.connectionStatus == ConnectionStatus.connected) {
            return const Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50), child: CommentAppBar()),
              body: CommentView(),
            );
          }

          else{
            return Scaffold(
              body: NoInternetConnection(
                  message: state.message ?? 'No Internet Connection'),
            );
          }
        },
      ),
    );
  }
}
