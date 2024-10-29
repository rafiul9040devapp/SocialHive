import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_list_comments/data/dio/api_client_dio.dart';
import 'package:infinity_list_comments/data/https/api_client_http.dart';
import 'package:infinity_list_comments/features/comment_details/bloc/comment_details_bloc.dart';
import 'package:infinity_list_comments/features/comments_of_post/bloc/comments_of_post_bloc.dart';
import 'package:infinity_list_comments/features/connectivity/bloc/connectivity_bloc.dart';
import 'package:infinity_list_comments/features/post/bloc/post_bloc.dart';
import 'package:infinity_list_comments/features/user/bloc/user_bloc.dart';
import 'package:infinity_list_comments/repository/comment/comment_repository.dart';
import 'package:infinity_list_comments/repository/comment/comment_repository_impl.dart';
import 'package:infinity_list_comments/repository/post/post_repository.dart';
import 'package:infinity_list_comments/repository/post/post_repository_impl.dart';

import '../features/comment/bloc/comment_bloc.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void setUp() {
    getIt.registerLazySingleton<http.Client>(() => http.Client());

    getIt.registerLazySingleton<Dio>(() => Dio());

    getIt.registerLazySingleton<Connectivity>(() => Connectivity());

    // you want to ensure that a single instance of a class is shared across the application,
    // but you don't want to create the instance until it is actually needed.
    getIt.registerLazySingleton<ApiClientHttp>(
        () => ApiClientHttp(httpClient: getIt<http.Client>()));

    getIt.registerLazySingleton<ApiClientDio>(
        () => ApiClientDio(dio: getIt<Dio>()));

    //repository
    getIt.registerLazySingleton<CommentRepository>(() => CommentRepositoryImpl(
        apiClientDio: getIt<ApiClientDio>(),
        apiClient: getIt<ApiClientHttp>()));

    getIt.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(getIt<ApiClientDio>()));

    // when you need a fresh instance of a class every time it's requested
    getIt.registerFactory(() => CommentBloc(repository: getIt<CommentRepository>()));
    getIt.registerFactory(() => ConnectivityBloc(connectivity: getIt()));
    getIt.registerFactory(() => CommentDetailsBloc());
    getIt.registerFactory(() => UserBloc(repository: getIt<CommentRepository>()));
    getIt.registerFactory(()=> PostBloc(repository: getIt<PostRepository>()));
    getIt.registerFactory(()=> CommentsOfPostBloc(repository: getIt<PostRepository>()));
  }
}
