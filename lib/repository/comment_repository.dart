import 'package:dartz/dartz.dart';
import 'package:infinity_list_comments/comment/models/album.dart';
import 'package:infinity_list_comments/data/api_exception.dart';

abstract class CommentRepository{
  Future<Either<ApiException,List<Album>>> fetchComments([int startIndex =0]);
  Future<Either<ApiException,List<Album>>> fetchCommentsHttp([int startIndex =0]);
}