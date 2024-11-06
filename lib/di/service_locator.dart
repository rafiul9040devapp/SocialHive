import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_list_comments/data/dio/api_client_dio.dart';
import 'package:infinity_list_comments/data/https/api_client_http.dart';
import 'package:infinity_list_comments/features/albums_of_user/bloc/albums_of_user_bloc.dart';
import 'package:infinity_list_comments/features/comment/bloc/comment_bloc.dart';
import 'package:infinity_list_comments/features/comment_details/bloc/comment_details_bloc.dart';
import 'package:infinity_list_comments/features/comments_of_post/bloc/comments_of_post_bloc.dart';
import 'package:infinity_list_comments/features/connectivity/bloc/connectivity_bloc.dart';
import 'package:infinity_list_comments/features/details_of_user_profile/bloc/tab_bloc.dart';
import 'package:infinity_list_comments/features/home/bloc/navigation_bloc.dart';
import 'package:infinity_list_comments/features/photos_of_user/bloc/photos_of_user_bloc.dart';
import 'package:infinity_list_comments/features/post/bloc/post_bloc.dart';
import 'package:infinity_list_comments/features/post_details/bloc/post_details_bloc.dart';
import 'package:infinity_list_comments/features/post_of_user/bloc/post_of_user_bloc.dart';
import 'package:infinity_list_comments/features/user/bloc/user_bloc.dart';
import 'package:infinity_list_comments/features/user_list/bloc/user_list_bloc.dart';
import 'package:infinity_list_comments/repository/comment/comment_repository.dart';
import 'package:infinity_list_comments/repository/comment/comment_repository_impl.dart';
import 'package:infinity_list_comments/repository/post/post_repository.dart';
import 'package:infinity_list_comments/repository/post/post_repository_impl.dart';
import 'package:infinity_list_comments/repository/user/user_repository.dart';
import 'package:infinity_list_comments/repository/user/user_repository_impl.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void setUp() {
    _registerClients();
    _registerRepositories();
    _registerBlocs();
  }

  /// Registers HTTP and Dio clients along with connectivity services.
  static void _registerClients() {
    getIt.registerLazySingleton<http.Client>(() => http.Client());
    getIt.registerLazySingleton<Dio>(() => Dio());
    getIt.registerLazySingleton<Connectivity>(() => Connectivity());

    getIt.registerLazySingleton<ApiClientHttp>(
          () => ApiClientHttp(httpClient: getIt<http.Client>()),
    );
    getIt.registerLazySingleton<ApiClientDio>(
          () => ApiClientDio(dio: getIt<Dio>()),
    );
  }

  /// Registers repositories for comments, posts, and users.
  static void _registerRepositories() {
    getIt.registerLazySingleton<CommentRepository>(
          () => CommentRepositoryImpl(
        apiClientDio: getIt<ApiClientDio>(),
        apiClient: getIt<ApiClientHttp>(),
      ),
    );
    getIt.registerLazySingleton<PostRepository>(
          () => PostRepositoryImpl(getIt<ApiClientDio>()),
    );
    getIt.registerLazySingleton<UserRepository>(
          () => UserRepositoryImpl(getIt<ApiClientDio>()),
    );
  }

  /// Registers BLoC factories for each feature.
  static void _registerBlocs() {
    // Comment-related blocs
    getIt.registerFactory(() => CommentBloc(repository: getIt<CommentRepository>()));
    getIt.registerFactory(() => CommentsOfPostBloc(repository: getIt<PostRepository>()));
    getIt.registerFactory(() => CommentDetailsBloc());

    // Post-related blocs
    getIt.registerFactory(() => PostBloc(repository: getIt<PostRepository>()));
    getIt.registerFactory(() => PostDetailsBloc());

    // User-related blocs
    getIt.registerFactory(() => UserBloc(repository: getIt<CommentRepository>()));
    getIt.registerFactory(() => UserListBloc(repository: getIt<UserRepository>()));
    getIt.registerFactory(() => PostOfUserBloc(repository: getIt<UserRepository>()));
    getIt.registerFactory(() => AlbumsOfUserBloc(repository: getIt<UserRepository>()));
    getIt.registerFactory(() => PhotosOfUserBloc(repository: getIt<UserRepository>()));

    // Connectivity and Navigation blocs
    getIt.registerFactory(() => ConnectivityBloc(connectivity: getIt()));
    getIt.registerFactory(() => NavigationBloc());
    getIt.registerFactory(() => TabBloc());
  }
}
