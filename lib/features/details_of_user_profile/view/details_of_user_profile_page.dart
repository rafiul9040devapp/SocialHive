import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/connectivity/bloc/connectivity_bloc.dart';
import 'package:infinity_list_comments/features/details_of_user_profile/bloc/tab_bloc.dart';
import 'package:infinity_list_comments/features/details_of_user_profile/view/details_of_user_profile_view.dart';
import 'package:infinity_list_comments/features/user_list/model/user_profile.dart';
import 'package:infinity_list_comments/widgets/custom_app_bar.dart';

import '../../../widgets/initial_state_display.dart';
import '../../connectivity/view/components/no_internet_connection.dart';

class DetailsOfUserProfilePage extends StatelessWidget {
  final UserProfile userProfile;

  const DetailsOfUserProfilePage({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ConnectivityBloc>()),
        BlocProvider(create: (_) => getIt<TabBloc>()),
      ],
      child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          switch (state.connectionStatus) {
            case ConnectionStatus.initial:
              return const InitialStateDisplay();
            case ConnectionStatus.connected:
              return Scaffold(
                appBar: CustomAppBar(
                    title: userProfile.name ?? 'N/A', hasBackButton: true),
                body: DetailsOfUserProfileView(profileId: userProfile.id ?? 0),
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
