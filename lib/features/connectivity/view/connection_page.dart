import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/connectivity/bloc/connectivity_bloc.dart';
import 'package:infinity_list_comments/features/connectivity/view/connection_view.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ConnectivityBloc>(),
      child: const Scaffold(
        body: SafeArea(
          child: ConnectionView(),
        ),
      ),
    );
  }
}
