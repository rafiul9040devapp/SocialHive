import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_list_comments/comment/models/album.dart';
import 'package:infinity_list_comments/utils/api_constants.dart';

import '../api_exception.dart';

class ApiClientHttp {
  final http.Client httpClient;

  ApiClientHttp({required this.httpClient});

  Future<Either<ApiException, List<Album>>> fetchAlbum(
      [int startIndex = 0]) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.commentsEndPoint,
      <String, String>{
        '_start': '$startIndex',
        '_limit': '${ApiConstants.limit}',
      },
    );

    try {
      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body is List && body.isNotEmpty) {
          final albumList = body.map((json) => Album.fromJson(json)).toList();
          return Right(albumList);
        } else {
          return Left(ApiException('Invalid Empty Response'));
        }
      } else {
        return Left(ApiException.getApiStatus(response.statusCode));
      }
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

}
