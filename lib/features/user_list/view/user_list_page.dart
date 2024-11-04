import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/connectivity/bloc/connectivity_bloc.dart';
import 'package:infinity_list_comments/features/user/bloc/user_bloc.dart';
import 'package:infinity_list_comments/features/user_list/bloc/user_list_bloc.dart';
import 'package:infinity_list_comments/features/user_list/view/user_list_view.dart';
import 'package:infinity_list_comments/widgets/custom_app_bar.dart';
import 'package:infinity_list_comments/widgets/initial_state_display.dart';

import '../../connectivity/view/components/no_internet_connection.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ConnectivityBloc>()),
        BlocProvider(create: (_) => getIt<UserListBloc>()..add(FetchUserProfileListEvent())),
      ],
      child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          switch(state.connectionStatus){
            case ConnectionStatus.initial:
              return const InitialStateDisplay();
            case ConnectionStatus.connected:
              return const Scaffold(
                appBar: CustomAppBar(title: 'Profiles'),
                body: UserListView(),
              );
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
