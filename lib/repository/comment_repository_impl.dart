import 'package:dartz/dartz.dart';
import 'package:infinity_list_comments/data/api_exception.dart';
import 'package:infinity_list_comments/data/https/api_client_http.dart';
import 'package:infinity_list_comments/features/user/models/user.dart';
import 'package:infinity_list_comments/repository/comment_repository.dart';
import '../data/dio/api_client_dio.dart';
import '../features/comment/models/album.dart';

class CommentRepositoryImpl extends CommentRepository {
  final ApiClientDio apiClientDio;
  final ApiClientHttp apiClient;

  CommentRepositoryImpl({required this.apiClientDio, required this.apiClient});

  @override
  Future<Either<ApiException, List<Album>>> fetchCommentsDio(
      [int startIndex = 0]) async {
    return await apiClientDio.fetchAlbum(startIndex);
  }

  @override
  Future<Either<ApiException, List<Album>>> fetchCommentsHttp([int startIndex = 0]) async{
    return await apiClient.fetchAlbum(startIndex);
  }

  @override
  Future<Either<ApiException, List<User>>> fetchUserDio(String email) async {
   return await apiClientDio.fetchUserDetails(email);
  }
}
