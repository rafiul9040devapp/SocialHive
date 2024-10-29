
import 'package:dartz/dartz.dart';
import 'package:infinity_list_comments/data/api_exception.dart';
import 'package:infinity_list_comments/data/dio/api_client_dio.dart';
import 'package:infinity_list_comments/features/comments_of_post/models/comments_of_post.dart';
import 'package:infinity_list_comments/features/post/models/post.dart';
import 'package:infinity_list_comments/repository/post/post_repository.dart';

class PostRepositoryImpl extends PostRepository {

  final ApiClientDio _apiClientDio;

  PostRepositoryImpl(this._apiClientDio);

  @override
  Future<Either<ApiException, List<Post>>> fetchPost([int startIndex = 0]) {
    return _apiClientDio.fetchPost(startIndex);
  }

  @override
  Future<Either<ApiException, List<CommentsOfPost>>> fetchCommentsOfPost(int postId) {
    return _apiClientDio.fetchCommentsOfPost(postId);
  }

}