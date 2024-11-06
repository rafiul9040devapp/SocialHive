import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/albums_of_user/bloc/albums_of_user_bloc.dart';
import 'package:infinity_list_comments/features/albums_of_user/view/components/albums_of_user_item.dart';
import 'package:infinity_list_comments/widgets/loading_state_display.dart';

import '../../../widgets/error_message_display.dart';

class AlbumsOfUserView extends StatelessWidget {
  const AlbumsOfUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumsOfUserBloc, AlbumsOfUserState>(
      builder: (context, state) {
        return switch (state.status) {
          AlbumsOfUserStatus.initial => const SizedBox(),
          AlbumsOfUserStatus.loading => const LoadingStateDisplay(),
          AlbumsOfUserStatus.success => _buildSuccessContent(state),
          AlbumsOfUserStatus.failure => ErrorMessageDisplay(message: state.errorMessage),
        };
      },
    );
  }

  Widget _buildSuccessContent(AlbumsOfUserState state) {
    final response = state.albumsOfUser;
    return response.isEmpty
        ? ErrorMessageDisplay(message: state.errorMessage)
        : AlbumsOfUserItem(albums: response);
  }
}
