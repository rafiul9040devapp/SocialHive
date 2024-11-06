part of 'photos_in_the_album_bloc.dart';

enum PhotosInTheAlbumStatus{ initial,success,failure}

class PhotosInTheAlbumState extends Equatable{

  final PhotosInTheAlbumStatus status;
  final  List<PhotosOfUser> photos;
  final bool hasReachedMax;
  final String errorMessage;

  const PhotosInTheAlbumState({
    this.status = PhotosInTheAlbumStatus.initial,
    this.photos = const <PhotosOfUser>[],
    this.hasReachedMax = false,
    this.errorMessage = '',
  });

  PhotosInTheAlbumState copyWith({
    PhotosInTheAlbumStatus? status,
    List<PhotosOfUser>? photos,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return PhotosInTheAlbumState(
        status: status ?? this.status,
        photos: photos ?? this.photos,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [status,photos,hasReachedMax,errorMessage];

}