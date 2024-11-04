
import 'package:dartz/dartz.dart';

import '../../data/api_exception.dart';
import '../../features/albums_of_user/model/albums_of_user.dart';
import '../../features/photos_of_user/model/photos_of_user.dart';
import '../../features/post_of_user/model/posts_of_user.dart';
import '../../features/user_list/model/user_profile.dart';

abstract class UserRepository {
  Future<Either<ApiException, List<UserProfile>>> fetchAllUsers();
  Future<Either<ApiException, List<PhotosOfUser>>> fetchPhotosOfUser(String userId,[int startIndex = 0]);
  Future<Either<ApiException, List<PostsOfUser>>> fetchPostsOfUser(String userId);
  Future<Either<ApiException, List<AlbumsOfUser>>> fetchAlbumsOfUser(String userId);
}