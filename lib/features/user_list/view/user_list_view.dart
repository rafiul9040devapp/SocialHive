import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/user_list/bloc/user_list_bloc.dart';
import 'package:infinity_list_comments/features/user_list/view/components/user_profile_item.dart';

import '../../../widgets/error_message_display.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListBloc, UserListState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case UserListStatus.initial:
            return const SizedBox();
          case UserListStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case UserListStatus.success:
            final response = state.profiles;
            return response.isEmpty
                ? const ErrorMessageDisplay(message: 'There is not User')
                : UserProfileItem(profiles: response);
          case UserListStatus.failure:
            return ErrorMessageDisplay(message: state.errorMessage);
        }
      },
    );
  }
}
