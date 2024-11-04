
import 'package:dartz/dartz.dart';
import 'package:infinity_list_comments/data/api_exception.dart';
import 'package:infinity_list_comments/data/dio/api_client_dio.dart';
import 'package:infinity_list_comments/features/user_list/model/user_profile.dart';
import 'package:infinity_list_comments/repository/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository{

  final ApiClientDio _apiClientDio;

  UserRepositoryImpl(this._apiClientDio);

  @override
  Future<Either<ApiException, List<UserProfile>>> fetchAllUsers() {
   return _apiClientDio.fetchAllUsers();
  }

}