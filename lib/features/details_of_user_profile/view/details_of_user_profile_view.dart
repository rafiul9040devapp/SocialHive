import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/albums_of_user/view/albums_of_user_page.dart';
import 'package:infinity_list_comments/features/photos_of_user/view/photos_of_user_page.dart';
import 'package:infinity_list_comments/features/post_of_user/view/post_of_user_page.dart';
import 'package:infinity_list_comments/theme/app_colors.dart';

import '../bloc/tab_bloc.dart';

class DetailsOfUserProfileView extends StatefulWidget {
  final int profileId;

  const DetailsOfUserProfileView({super.key, required this.profileId});

  @override
  State<DetailsOfUserProfileView> createState() =>
      _DetailsOfUserProfileViewState();
}

class _DetailsOfUserProfileViewState extends State<DetailsOfUserProfileView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Listen to tab changes and update Bloc state
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        context.read<TabBloc>().add(TabEvent(_tabController.index));
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        if (_tabController.index != state.tabIndex) {
          _tabController.animateTo(state.tabIndex);
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              //going to work on the design
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: AppColors.blackPearl.withOpacity(0.5), // Custom color for the active tab
                        borderRadius: BorderRadius.circular(12),
                      ),
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white, // Color for active tab text
                      unselectedLabelColor: Colors.black, // Color for inactive tab text
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
                      tabs: const [
                        Tab(text: 'Post'),
                        Tab(text: 'Album'),
                        Tab(text: 'Photo'),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    PostOfUserPage(profileId: widget.profileId),
                    AlbumsOfUserPage(profileId: widget.profileId),
                    PhotosOfUserPage(profileId: widget.profileId),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
