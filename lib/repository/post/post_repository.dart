
import 'package:dartz/dartz.dart';

import '../../data/api_exception.dart';
import '../../features/comments_of_post/models/comments_of_post.dart';
import '../../features/post/models/post.dart';

abstract class PostRepository{
  Future<Either<ApiException, List<Post>>> fetchPost([int startIndex = 0]);
  Future<Either<ApiException, List<CommentsOfPost>>> fetchCommentsOfPost(int postId);
}