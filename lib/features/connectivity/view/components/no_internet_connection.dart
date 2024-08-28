import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinity_list_comments/theme/app_colors.dart';
import 'package:infinity_list_comments/theme/theme_service.dart';
import 'package:infinity_list_comments/utils/assets_path.dart';
import 'package:lottie/lottie.dart';

class NoInternetConnection extends StatelessWidget {
  final String message;

  const NoInternetConnection({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: Lottie.asset(AppAnimations.noInternetConnection,
                repeat: true,
                reverse: true,
                width: themeService.screenWidth * .8,
                height: themeService.screenHeight * .35),
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style:
                themeService.textTheme.titleLarge?.copyWith(color: AppColors.red),
          ),
          const SizedBox(height: 8),
          Text(
            'Please check your internet connection and try again.',
            style:
                themeService.textTheme.titleSmall?.copyWith(color: AppColors.red),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
