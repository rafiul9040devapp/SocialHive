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
      buildWhen: (previous, current) => current.status != previous.status,
      builder: (context, state) {
        return switch (state.status) {
          UserListStatus.initial => const SizedBox(),
          UserListStatus.loading => const Center(child: CircularProgressIndicator()),
          UserListStatus.success => _buildSuccessContent(state),
          UserListStatus.failure => ErrorMessageDisplay(message: state.errorMessage),
        };
      },
    );
  }

  Widget _buildSuccessContent(UserListState state) {
    final response = state.profiles;
    return response.isEmpty
        ? const ErrorMessageDisplay(message: 'No users found')
        : UserProfileItem(profiles: response);
  }
}
