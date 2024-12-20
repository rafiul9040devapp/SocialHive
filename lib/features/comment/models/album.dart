import 'package:freezed_annotation/freezed_annotation.dart';
part 'album.freezed.dart';
part 'album.g.dart';

@freezed
class Album with _$Album {

  const factory Album({
    required int postId,
    required int id,
    required String name,
    required String email,
    required String body,
  }) = _Album;

  factory Album.fromJson(Map<String, Object?> json)
  => _$AlbumFromJson(json);

}
