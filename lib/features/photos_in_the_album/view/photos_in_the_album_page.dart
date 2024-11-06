import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/albums_of_user/model/albums_of_user.dart';
import 'package:infinity_list_comments/features/connectivity/bloc/connectivity_bloc.dart';
import 'package:infinity_list_comments/features/photos_in_the_album/bloc/photos_in_the_album_bloc.dart';
import 'package:infinity_list_comments/features/photos_in_the_album/view/photos_in_the_album_view.dart';
import 'package:infinity_list_comments/widgets/initial_state_display.dart';

import '../../../widgets/custom_app_bar.dart';
import '../../connectivity/view/components/no_internet_connection.dart';

class PhotosInTheAlbumPage extends StatelessWidget {
  final AlbumsOfUser albumsOfUser;

  const PhotosInTheAlbumPage({super.key, required this.albumsOfUser});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ConnectivityBloc>()),
        BlocProvider(create: (_) => getIt<PhotosInTheAlbumBloc>()),
      ],
      child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          return switch (state.connectionStatus) {
            ConnectionStatus.initial => const InitialStateDisplay(),
            ConnectionStatus.connected => Scaffold(
                appBar: CustomAppBar(
                    title: albumsOfUser.title ?? 'N/A', hasBackButton: true),
                body: PhotosInTheAlbumView(albumsOfUser: albumsOfUser),
              ),
            ConnectionStatus.disconnected => Scaffold(
                body: NoInternetConnection(
                    message: state.message ?? 'No Internet Connection'),
              ),
          };
        },
      ),
    );
  }
}
