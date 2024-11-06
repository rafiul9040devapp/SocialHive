
import 'package:dartz/dartz.dart';
import 'package:infinity_list_comments/data/api_exception.dart';
import 'package:infinity_list_comments/data/dio/api_client_dio.dart';
import 'package:infinity_list_comments/features/albums_of_user/model/albums_of_user.dart';
import 'package:infinity_list_comments/features/photos_of_user/model/photos_of_user.dart';
import 'package:infinity_list_comments/features/post_of_user/model/posts_of_user.dart';
import 'package:infinity_list_comments/features/user_list/model/user_profile.dart';
import 'package:infinity_list_comments/repository/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository{

  final ApiClientDio _apiClientDio;

  UserRepositoryImpl(this._apiClientDio);

  @override
  Future<Either<ApiException, List<UserProfile>>> fetchAllUsers() {
   return _apiClientDio.fetchAllUsers();
  }

  @override
  Future<Either<ApiException, List<AlbumsOfUser>>> fetchAlbumsOfUser(String userId) {
   return _apiClientDio.fetchAlbumsOfUser(userId);
  }

  @override
  Future<Either<ApiException, List<PhotosOfUser>>> fetchPhotosOfUser(String userId, [int startIndex = 0]) {
    return _apiClientDio.fetchPhotosOfUser(userId);
  }

  @override
  Future<Either<ApiException, List<PostsOfUser>>> fetchPostsOfUser(String userId) {
    return _apiClientDio.fetchPostsOfUser(userId);
  }

  @override
  Future<Either<ApiException, List<PhotosOfUser>>> fetchPhotosFromAlbumOfUser(String albumId, [int startIndex = 0]) {
    return _apiClientDio.fetchPhotosFromAlbumOfUser(albumId);
  }

}