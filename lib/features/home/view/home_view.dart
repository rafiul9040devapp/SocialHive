import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/comment/view/comment_page.dart';
import 'package:infinity_list_comments/features/post/view/post_page.dart';
import 'package:infinity_list_comments/route/app_routes.dart';

import '../bloc/navigation_bloc.dart';

class HomeView extends StatefulWidget {
  final int initialPage;
  const HomeView({super.key, required this.initialPage});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onBottomNavTapped(int index) {
    context.read<NavigationBloc>().add(PageTapped(index));
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return PageView(
            controller: _pageController,
            onPageChanged: (index) {
              context.read<NavigationBloc>().add(PageTapped(index));
              final routeName = index == 0 ? Routes.comment.path() : Routes.post.path();
              router.goNamed(routeName);
            },
            children: const [
              CommentPage(),
              PostPage(),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.selectedIndex,
            onTap: _onBottomNavTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.comment),
                label: 'Comments',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.post_add),
                label: 'Posts',
              ),
            ],
          );
        },
      ),
    );
  }
}