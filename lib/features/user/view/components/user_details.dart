import 'package:flutter/material.dart';
import 'package:infinity_list_comments/features/user/models/user.dart';
import 'package:infinity_list_comments/features/user/view/components/user_details_app_bar.dart';


class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: UserDetailsAppBar()),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(user.username),
            )
          ],
        ),
      ),
    );
  }
}
