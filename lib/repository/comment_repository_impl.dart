import 'package:dartz/dartz.dart';
import 'package:infinity_list_comments/comment/models/album.dart';
import 'package:infinity_list_comments/data/api_exception.dart';
import 'package:infinity_list_comments/data/https/api_client_http.dart';
import 'package:infinity_list_comments/repository/comment_repository.dart';
import '../data/dio/api_client_dio.dart';

class CommentRepositoryImpl extends CommentRepository {
  final ApiClientDio apiClientDio;
  final ApiClientHttp apiClient;

  CommentRepositoryImpl({required this.apiClientDio, required this.apiClient});

  @override
  Future<Either<ApiException, List<Album>>> fetchComments(
      [int startIndex = 0]) async {
    return await apiClientDio.fetchAlbum(startIndex);
  }

  @override
  Future<Either<ApiException, List<Album>>> fetchCommentsHttp([int startIndex = 0]) async{
    return await apiClient.fetchAlbum(startIndex);
  }
}
