import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infinity_list_comments/features/user_list/model/user_profile.dart';
import 'package:infinity_list_comments/route/app_routes.dart';
import 'package:infinity_list_comments/theme/app_colors.dart';

class UserProfileItem extends StatelessWidget {
  final List<UserProfile> profiles;

  const UserProfileItem({super.key, required this.profiles});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.custom(
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2, // Number of columns in the woven layout
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          pattern: [
            const WovenGridTile(1.0), // Full width
            const WovenGridTile(
              5 / 7,
              crossAxisRatio: 1, // Adjust ratio for woven effect
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: profiles.length,
          (context, index) {
            final profile = profiles[index];
            return _buildUserProfile(theme, profile);
          },
        ),
      ),
    );
  }

  Widget _buildUserProfile(ColorScheme theme, UserProfile profile) {
    return GestureDetector(
      onTap: (){
        router.push(Routes.detailsOfUserProfile.path(profile.name ?? ''),extra: profile);
      },
      child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 2.0,
              color: theme.tertiary,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                        child:  const Icon(Icons.arrow_outward,color:AppColors.blackPearl),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: Text(
                        profile.name ?? 'No Name',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
