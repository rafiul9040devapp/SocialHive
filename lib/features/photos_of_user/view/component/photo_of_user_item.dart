import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:infinity_list_comments/features/photos_of_user/model/photos_of_user.dart';
import 'package:infinity_list_comments/widgets/loading_state_display.dart';

import '../../../../theme/app_colors.dart';

class PhotoOfUserItem extends StatelessWidget {
  final PhotosOfUser photosOfUser;

  const PhotoOfUserItem({super.key, required this.photosOfUser});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child:  CachedNetworkImage(
        imageUrl: photosOfUser.url ?? '',
        placeholder: (context, url) => const LoadingStateDisplay(),
        errorWidget: (context, url, error) => const Icon(Icons.error,color: AppColors.red,),
        fit: BoxFit.cover,
        width: double.infinity,
        height: 150,
      ),
    );
  }
}
