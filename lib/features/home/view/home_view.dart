import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/features/comment/view/comment_page.dart';
import 'package:infinity_list_comments/features/post/view/post_page.dart';
import 'package:infinity_list_comments/features/user_list/view/user_list_page.dart';
import 'package:infinity_list_comments/route/app_routes.dart';

import '../bloc/navigation_bloc.dart';

class HomeView extends StatefulWidget {
  final int initialPage;
  const HomeView({super.key, required this.initialPage});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);

    // Initialize AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onBottomNavTapped(int index) {
    context.read<NavigationBloc>().add(PageTapped(index));
    _pageController.animateToPage(
      index,
      duration: const Duration(seconds: 1), // delay for the transition
      curve: Curves.easeInOut, // smoother animation curve
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          _animationController.forward(from: 0); // Restart animation on page change
          return SlideTransition(
            position: _slideAnimation,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                context.read<NavigationBloc>().add(PageTapped(index));
                // final routeName = index == 0 ? Routes.comment.path() : Routes.post.path();

                final routeName =  switch(index){
                   0 => Routes.comment.path(),
                   1 => Routes.post.path(),
                   2 => Routes.userList.path(),
                  int() => throw UnimplementedError(),
                };

                router.goNamed(routeName);
              },
              children: const [
                CommentPage(),
                PostPage(),
                UserListPage(),
              ],
            ),
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
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
