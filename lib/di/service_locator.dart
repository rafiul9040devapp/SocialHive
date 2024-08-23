import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_list_comments/comment/bloc/comment_bloc.dart';
import 'package:infinity_list_comments/data/dio/api_client_dio.dart';
import 'package:infinity_list_comments/data/https/api_client_http.dart';
import 'package:infinity_list_comments/repository/comment_repository.dart';
import 'package:infinity_list_comments/repository/comment_repository_impl.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void setUp() {

    getIt.registerLazySingleton<http.Client>(() =>http.Client());

    getIt.registerLazySingleton<Dio>(() => Dio());


    // you want to ensure that a single instance of a class is shared across the application,
    // but you don't want to create the instance until it is actually needed.
    getIt.registerLazySingleton<ApiClientHttp>(
        () => ApiClientHttp(httpClient: getIt<http.Client>()));

    getIt.registerLazySingleton<ApiClientDio>(
        () => ApiClientDio(dio: getIt<Dio>()));

    getIt.registerLazySingleton<CommentRepository>(() => CommentRepositoryImpl(
        apiClientDio: getIt<ApiClientDio>(), apiClient: getIt<ApiClientHttp>()));


    // when you need a fresh instance of a class every time it's requested
    getIt.registerFactory(
        () => CommentBloc(repository: getIt<CommentRepository>()));

  }
}
