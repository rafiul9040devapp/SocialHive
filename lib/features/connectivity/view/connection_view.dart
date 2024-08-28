import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/connectivity/bloc/connectivity_bloc.dart';
import 'package:infinity_list_comments/features/connectivity/view/components/no_internet_connection.dart';

import '../../comment/view/comment_page.dart';

class ConnectionView extends StatelessWidget {
  const ConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        switch (state.connectionStatus) {
          case ConnectionStatus.initial:
            return const Center(child: CircularProgressIndicator(color: Colors.lightBlue));
          case ConnectionStatus.connected:
            return const CommentPage();
          case ConnectionStatus.disconnected:
            return NoInternetConnection(message: state.message ?? 'No Internet Connection');
        }
      },
    );
  }
}
