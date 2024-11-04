
import 'package:dartz/dartz.dart';

import '../../data/api_exception.dart';
import '../../features/user_list/model/user_profile.dart';

abstract class UserRepository {
  Future<Either<ApiException, List<UserProfile>>> fetchAllUsers();
}