import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/comment/models/album.dart';
import 'package:infinity_list_comments/features/comment/view/comment_page.dart';
import 'package:infinity_list_comments/features/comment_details/view/comment_details_page.dart';
import 'package:infinity_list_comments/features/connectivity/view/connection_page.dart';

enum Routes {
  home,
  comment,
  commentDetails,
}

extension RouteExtensions on Routes {
  String path([String? id]) {
    switch (this) {
      case Routes.home:
        return '/home';
      case Routes.comment:
        return '/comment';
      case Routes.commentDetails:
        return id != null ? '/comment_details/$id' : '/comment_details';
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
        initialLocation: Routes.home.path(),
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
            path: Routes.commentDetails.path(':id'),
            builder: (context, state) {
              final comment = state.extra as Album;
              return CommentDetailsPage(album: comment);
            },
          ),
        ],
      ),
    );
  }
}
