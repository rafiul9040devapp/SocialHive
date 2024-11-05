import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/albums_of_user/view/albums_of_user_page.dart';
import 'package:infinity_list_comments/features/photos_of_user/view/photos_of_user_page.dart';
import 'package:infinity_list_comments/features/post_of_user/view/post_of_user_page.dart';


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
          padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0),
          child: Column(
            children: [
              //going to work on the design
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Post'),
                  Tab(text: 'Album'),
                  Tab(text: 'Photo'),
                ],
              ),

              const SizedBox(height: 8),

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
