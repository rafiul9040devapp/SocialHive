import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:infinity_list_comments/features/comments_of_post/models/comments_of_post.dart';
import 'package:infinity_list_comments/features/post/models/post.dart';
import 'package:infinity_list_comments/features/user/models/user.dart';

import '../../features/comment/models/album.dart';
import '../../utils/api_constants.dart';
import '../api_exception.dart';

class ApiClientDio {
  final Dio dio;

  ApiClientDio({required this.dio});

  Future<Either<ApiException, List<Album>>> fetchAlbum(
      [int startIndex = 0]) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.commentsEndPoint,
      <String, String>{
        '_start': startIndex.toString(),
        '_limit': ApiConstants.limit.toString(),
      },
    );

    try {
      final response = await dio.getUri(uri,
          options: Options(responseType: ResponseType.json));
      if (response.statusCode == 200) {
        final List<dynamic> body = response.data as List<dynamic>;
        if (body.isNotEmpty) {
          final albumList = body.map((json) => Album.fromJson(json)).toList();
          return Right(albumList);
        } else {
          return Left(ApiException('Invalid Empty Response'));
        }
      } else {
        return Left(ApiException.getApiStatus(response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      return Left(ApiException(e.message.toString(), e.response?.statusCode));
    } catch (e) {
      return Left(ApiException('Unexpected error: $e'));
    }
  }

  Future<Either<ApiException, List<User>>> fetchUserDetails(String email) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.userEndPoint,
      <String, String>{
        'email': email,
      },
    );

    try {
      final response = await dio.getUri(uri,
          options: Options(responseType: ResponseType.json));

      if (response.statusCode == 200) {
        final List<dynamic> body = response.data as List<dynamic>;
        if (body.isNotEmpty) {
          final user = body.map((json) => User.fromJson(json)) as List<User>;
          return Right(user);
        } else {
          return Left(ApiException('User Not Found'));
        }
      } else {
        return Left(ApiException.getApiStatus(response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      return Left(ApiException(e.message.toString(), e.response?.statusCode));
    } catch (e) {
      return Left(ApiException('Unexpected error: $e'));
    }
  }


  Future<Either<ApiException, List<Post>>> fetchPost([int startIndex = 0]) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.postsEndPoint,
      <String, String>{
        '_start': '$startIndex',
        '_limit': '${ApiConstants.limit}',
      },
    );

    try {
      final response = await dio.getUri(uri,
          options: Options(responseType: ResponseType.json));
      if (response.statusCode == 200) {
        final body = response.data;
        if (body is List && body.isNotEmpty) {
          final postList = body.map((json) => Post.fromJson(json)).toList();
          return Right(postList);
        } else {
          return const Right([]); // Return empty list if no data
        }
      }else {
        return Left(ApiException.getApiStatus(response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      return Left(ApiException(e.message.toString(), e.response?.statusCode));
    } catch (e) {
      return Left(ApiException('Unexpected error: $e'));
    }
  }

  ///posts/1/comments

  Future<Either<ApiException, List<CommentsOfPost>>> fetchCommentsOfPost(int postId) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      '/posts/$postId/comments',
    );

    try {
      final response = await dio.getUri(uri,
          options: Options(responseType: ResponseType.json));
      if (response.statusCode == 200) {
        final List<dynamic> body = response.data as List<dynamic>;
        if (body.isNotEmpty) {
          final commentsOfPostList = body.map((json) => CommentsOfPost.fromJson(json)).toList();
          return Right(commentsOfPostList);
        } else {
          return Left(ApiException('There is no comment in this post'));
        }
      } else {
        return Left(ApiException.getApiStatus(response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      return Left(ApiException(e.message.toString(), e.response?.statusCode));
    } catch (e) {
      return Left(ApiException('Unexpected error: $e'));
    }
  }

}
