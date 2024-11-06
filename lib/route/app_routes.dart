import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/albums_of_user/model/albums_of_user.dart';
import 'package:infinity_list_comments/features/albums_of_user/view/albums_of_user_page.dart';
import 'package:infinity_list_comments/features/comment/models/album.dart';
import 'package:infinity_list_comments/features/comment_details/view/comment_details_page.dart';
import 'package:infinity_list_comments/features/comments_of_post/view/comments_of_post_page.dart';
import 'package:infinity_list_comments/features/connectivity/view/connection_page.dart';
import 'package:infinity_list_comments/features/details_of_user_profile/view/details_of_user_profile_page.dart';
import 'package:infinity_list_comments/features/home/view/home_page.dart';
import 'package:infinity_list_comments/features/photos_in_the_album/view/photos_in_the_album_page.dart';
import 'package:infinity_list_comments/features/photos_of_user/view/photos_of_user_page.dart';
import 'package:infinity_list_comments/features/post/models/post.dart';
import 'package:infinity_list_comments/features/post_details/view/post_details_page.dart';
import 'package:infinity_list_comments/features/post_of_user/view/post_of_user_page.dart';
import 'package:infinity_list_comments/features/user/view/user_page.dart';
import 'package:infinity_list_comments/features/user_list/model/user_profile.dart';


GoRouter get router => GetIt.instance<GoRouter>();


enum Routes {
  home,
  comment,
  commentDetails,
  user,
  post,
  postDetails,
  commentsOfPost,
  userList,
  detailsOfUserProfile,
  postOfUser,
  photosOfUser,
  albumsOfUser,
  photosInTheAlbum,
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
      case Routes.userList:
        return '/user_list';
      case Routes.detailsOfUserProfile:
        return argument != null ? '/details_of_user_profile/:argument' : '/details_of_user_profile';
      case Routes.postOfUser:
        return argument != null ? '/posts_of_user/:argument' : '/posts_of_user';
      case Routes.photosOfUser:
        return argument != null ? '/photos_of_user/:argument' : '/photos_of_user';
      case Routes.albumsOfUser:
        return argument != null ? '/albums_of_user/:argument' : '/albums_of_user';
      case Routes.photosInTheAlbum:
        return argument != null ? '/photos_in_the_album/:argument' : '/photos_in_the_album';

    }
  }
}


class AppRoutes {
  static void setupRouter() {
    getIt.registerLazySingleton<GoRouter>(
      () => GoRouter(
        initialLocation: Routes.comment.path(),
        routes: [
          GoRoute(
            path: Routes.home.path(),
            builder: (context, state) => const ConnectionPage(),
          ),
          GoRoute(
            name:Routes.comment.path(),
            path: Routes.comment.path(),
            builder: (context, state) => const HomePage(initialPage: 0),
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
            name: Routes.post.path(),
            path: Routes.post.path(),
            builder: (context, state) => const HomePage(initialPage: 1),
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

          GoRoute(
            name: Routes.userList.path(),
            path: Routes.userList.path(),
            builder: (context, state) => const HomePage(initialPage: 2),
          ),

          GoRoute(
            path: Routes.detailsOfUserProfile.path(':argument'),
            builder: (context, state) {
              final profile = state.extra as UserProfile;
              return DetailsOfUserProfilePage(userProfile: profile);
            },
          ),

          GoRoute(
            path: Routes.postOfUser.path(':argument'),
            builder: (context, state) {
              final profileId = state.extra as int;
              return PostOfUserPage(profileId: profileId);
            },
          ),

          GoRoute(
            path: Routes.photosOfUser.path(':argument'),
            builder: (context, state) {
              final profileId = state.extra as int;
              return PhotosOfUserPage(profileId: profileId);
            },
          ),

          GoRoute(
            path: Routes.albumsOfUser.path(':argument'),
            builder: (context, state) {
              final profileId = state.extra as int;
              return AlbumsOfUserPage(profileId: profileId);
            },
          ),

          GoRoute(
            path: Routes.photosInTheAlbum.path(':argument'),
            builder: (context, state) {
              final album = state.extra as AlbumsOfUser;
              return PhotosInTheAlbumPage(albumsOfUser: album);
            },
          ),


        ],
      ),
    );
  }
}
