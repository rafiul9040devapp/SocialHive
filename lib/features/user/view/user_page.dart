import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/connectivity/bloc/connectivity_bloc.dart';
import 'package:infinity_list_comments/features/user/bloc/user_bloc.dart';
import 'package:infinity_list_comments/features/user/view/user_view.dart';
import '../../connectivity/view/components/no_internet_connection.dart';
import 'components/user_details.dart';
import 'components/user_details_app_bar.dart';

class UserPage extends StatelessWidget {
  final String userEmail;

  const UserPage({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ConnectivityBloc>()),
        BlocProvider(
            create: (_) =>
                getIt<UserBloc>()..add(FetchUserEvent(userEmail: userEmail))),
      ],
      child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          switch (state.connectionStatus) {
            case ConnectionStatus.initial:
              return const Scaffold(
                body: Center(
                    child: CircularProgressIndicator()),
              );
            case ConnectionStatus.connected:
              return const UserView();
            case ConnectionStatus.disconnected:
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
