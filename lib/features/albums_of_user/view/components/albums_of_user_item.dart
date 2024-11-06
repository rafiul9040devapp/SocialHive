import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infinity_list_comments/features/albums_of_user/model/albums_of_user.dart';
import 'package:infinity_list_comments/route/app_routes.dart';
import 'package:infinity_list_comments/theme/theme_service.dart';

import '../../../../theme/app_colors.dart';

class AlbumsOfUserItem extends StatelessWidget {
  final List<AlbumsOfUser> albums;

  const AlbumsOfUserItem({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return MasonryGridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        return _buildAlbumsOfUserCard(theme, album);
      },
    );
  }

  Widget _buildAlbumsOfUserCard(ColorScheme theme, AlbumsOfUser album) {
    return GestureDetector(
      onTap: (){
        router.push(Routes.photosInTheAlbum.path(album.id.toString()),extra: album);
      },
      child: Card(
        elevation: 3,
        color: theme.tertiary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: theme.tertiary,
                  radius: 15,
                  child: Text(
                    album.id.toString(),
                    style: const TextStyle(
                        color: AppColors.blackPearl, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                album.title.toString(),
                style: themeService.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
