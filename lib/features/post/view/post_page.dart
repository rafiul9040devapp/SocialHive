import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/post/bloc/post_bloc.dart';
import 'package:infinity_list_comments/features/post/view/components/post_app_bar.dart';
import 'package:infinity_list_comments/features/post/view/post_view.dart';


import '../../connectivity/bloc/connectivity_bloc.dart';
import '../../connectivity/view/components/no_internet_connection.dart';

class PostPage extends StatelessWidget {

  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => getIt<ConnectivityBloc>()),
      BlocProvider(create: (_) => getIt<PostBloc>()),
    ],
        child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
          builder: (context, state) {
            if (state.connectionStatus == ConnectionStatus.connected) {
              return const Scaffold(
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(50), child: PostAppBar()),
                body: PostView(),
              );
            }

            if(state.connectionStatus == ConnectionStatus.disconnected){
              return Scaffold(
                body: NoInternetConnection(
                    message: state.message ?? 'No Internet Connection'),
              );
            }

            else{
              return const Scaffold(
                body: SizedBox(),
              );
            }
          },
        ),);
  }
}
