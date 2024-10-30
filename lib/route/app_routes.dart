import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/comment/models/album.dart';
import 'package:infinity_list_comments/features/comment/view/comment_page.dart';
import 'package:infinity_list_comments/features/comment_details/view/comment_details_page.dart';
import 'package:infinity_list_comments/features/comments_of_post/view/comments_of_post_page.dart';
import 'package:infinity_list_comments/features/connectivity/view/connection_page.dart';
import 'package:infinity_list_comments/features/post/models/post.dart';
import 'package:infinity_list_comments/features/post/view/post_page.dart';
import 'package:infinity_list_comments/features/post_details/view/post_details_page.dart';
import 'package:infinity_list_comments/features/user/view/user_page.dart';

enum Routes {
  home,
  comment,
  commentDetails,
  user,
  post,
  postDetails,
  commentsOfPost,
}

extension RouteExtensions on Routes {
  String path([String? argument]) {
    switch (this) {
      case Routes.home:
        return '/home';
      case Routes.comment:
        return '/comment';
      case Routes.commentDetails:
        return argument != null ? '/comment_details/:argument' : '/comment_details';
      case Routes.user:
        return argument != null ? '/user/:argument' : '/user';
      case Routes.post:
        return '/post';
      case Routes.postDetails:
        return argument != null ? '/post_details/:argument' : '/post_details';
      case Routes.commentsOfPost:
        return argument != null ? '/comments_of_post/:argument' : '/comments_of_post';

      // case AppRoute.login:
      //   return '/login';
      // case AppRoute.settings:
      //   return '/settings';
      // case AppRoute.profile:
      //   return id != null ? '/profile/$id' : '/profile';




    }
  }
}

GoRouter get router => GetIt.instance<GoRouter>();

class AppRoutes {
  static void setupRouter() {
    getIt.registerLazySingleton<GoRouter>(
      () => GoRouter(
        initialLocation: Routes.post.path(),
        routes: [
          GoRoute(
            path: Routes.home.path(),
            builder: (context, state) => const ConnectionPage(),
          ),
          GoRoute(
            path: Routes.comment.path(),
            builder: (context, state) => const CommentPage(),
          ),
          GoRoute(
            path: Routes.commentDetails.path(':argument'),
            builder: (context, state) {
              final comment = state.extra as Album;
              return CommentDetailsPage(album: comment);
            },
          ),
          GoRoute(
            path: Routes.user.path(':argument'),
            builder: (context, state) {
              final email = state.extra as String;
              return UserPage(userEmail: email);
            },
          ),
          GoRoute(
            path: Routes.post.path(),
            builder: (context, state) => const PostPage(),
          ),
          GoRoute(
            path: Routes.postDetails.path(':argument'),
            builder: (context, state) {
              final post = state.extra as Post;
              return PostDetailsPage(post: post);
            },
          ),
          GoRoute(
            path: Routes.commentsOfPost.path(':argument'),
            builder: (context, state) {
              final postId = state.extra as int;
              return CommentsOfPostPage(postId: postId);
            },
          ),
        ],
      ),
    );
  }
}
