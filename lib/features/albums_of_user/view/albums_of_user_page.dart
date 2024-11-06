import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/albums_of_user/bloc/albums_of_user_bloc.dart';
import 'package:infinity_list_comments/features/albums_of_user/view/albums_of_user_view.dart';

class AlbumsOfUserPage extends StatelessWidget {
  final int profileId;

  const AlbumsOfUserPage({super.key, required this.profileId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AlbumsOfUserBloc>()
        ..add(FetchAllAlbumsOfUserEvent(profileId: profileId)),
      child: const AlbumsOfUserView(),
    );
  }
}
