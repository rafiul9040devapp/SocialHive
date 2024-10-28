import 'package:dartz/dartz.dart';
import 'package:infinity_list_comments/data/api_exception.dart';
import 'package:infinity_list_comments/features/user/models/user.dart';

import '../features/comment/models/album.dart';

abstract class CommentRepository{
  Future<Either<ApiException,List<Album>>> fetchCommentsDio([int startIndex =0]);
  Future<Either<ApiException,List<User>>> fetchUserDio(String email);
  Future<Either<ApiException,List<Album>>> fetchCommentsHttp([int startIndex =0]);
}