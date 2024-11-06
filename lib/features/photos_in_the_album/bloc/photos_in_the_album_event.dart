part of 'photos_in_the_album_bloc.dart';


sealed class PhotosInTheAlbumEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class FetchPhotosFromAlbumEvent extends PhotosInTheAlbumEvent{
  final int albumId;
  FetchPhotosFromAlbumEvent({required this.albumId});
  @override
  List<Object?> get props => [albumId];
}