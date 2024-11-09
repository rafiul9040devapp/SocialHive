import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:infinity_list_comments/features/photos_of_user/model/photos_of_user.dart';
import 'package:infinity_list_comments/theme/app_colors.dart';
import 'package:infinity_list_comments/widgets/loading_state_display.dart';

class PhotosInTheAlbumItem extends StatelessWidget {
  final PhotosOfUser photosOfUser;

  const PhotosInTheAlbumItem({super.key, required this.photosOfUser});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 4.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          imageUrl: photosOfUser.url ?? '',
          placeholder: (context, url) => const LoadingStateDisplay(),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: AppColors.concrete,
            size: 40.0,
          ),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
