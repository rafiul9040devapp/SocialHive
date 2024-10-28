import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/user/bloc/user_bloc.dart';
import 'package:infinity_list_comments/features/user/view/components/user_details.dart';

import '../../../widgets/error_message_display.dart';
import 'components/user_details_app_bar.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        switch (state.status) {
          case UserStatus.initial:
            return const Scaffold(
              body: Center(
                  child: CircularProgressIndicator()),
            );
          case UserStatus.success:
            final user = state.userList;
            if (user.isNotEmpty) {
              return UserDetails(user: user[0]);
            } else {
              return Scaffold(
                  appBar: const PreferredSize(
                      preferredSize: Size.fromHeight(50), child: UserDetailsAppBar()),
                  body: ErrorMessageDisplay(message: state.errorMessage));
            }
          case UserStatus.failure:
            return Scaffold(
                appBar: const PreferredSize(
                    preferredSize: Size.fromHeight(50), child: UserDetailsAppBar()),
                body: ErrorMessageDisplay(message: state.errorMessage));
        }
      },
    );
  }
}
