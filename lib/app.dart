import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/comment/view/comment_page.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/connectivity/bloc/connectivity_bloc.dart';
import 'package:infinity_list_comments/features/connectivity/view/no_internet_connection_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comment App',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => getIt<ConnectivityBloc>(),
        child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
          builder: (context, state) {
            if (state.connectionStatus == ConnectionStatus.connected) {
              return const CommentPage();
            } else {
              return const NoInternetConnectionPage();
            }
          },
        ),
      ),
    );
  }
}
