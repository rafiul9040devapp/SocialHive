import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/photos_of_user/bloc/photos_of_user_bloc.dart';
import 'package:infinity_list_comments/features/photos_of_user/view/photos_of_user_view.dart';

class PhotosOfUserPage extends StatelessWidget {
  final int profileId;

  const PhotosOfUserPage({super.key, required this.profileId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PhotosOfUserBloc>(),
      child: PhotosOfUserView(profileId: profileId),
    );
  }
}
