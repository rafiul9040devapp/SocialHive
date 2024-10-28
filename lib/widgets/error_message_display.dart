import 'package:flutter/material.dart';
import 'package:infinity_list_comments/theme/app_colors.dart';
import 'package:infinity_list_comments/theme/theme_service.dart';
import 'package:infinity_list_comments/utils/assets_path.dart';
import 'package:lottie/lottie.dart';

class ErrorMessageDisplay extends StatelessWidget {
  final String message;

  const ErrorMessageDisplay({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: Lottie.asset(
              AppAnimations.noInternetConnection,
              repeat: true,
              reverse: true,
              width: themeService.screenWidth * 0.8,
              height: themeService.screenHeight * 0.3,
            ),
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: themeService.textTheme.titleLarge?.copyWith(color: AppColors.red),
          ),
        ],
      ),
    );
  }
}
