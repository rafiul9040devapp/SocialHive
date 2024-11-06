part of 'photos_of_user_bloc.dart';

enum PhotoOfUserStatus { initial, success, failure }

final class PhotosOfUserState extends Equatable {
  final PhotoOfUserStatus status;
  final List<PhotosOfUser> photos;
  final bool hasReachedMax;
  final String errorMessage;

  const PhotosOfUserState({
    this.status = PhotoOfUserStatus.initial,
    this.photos = const <PhotosOfUser>[],
    this.hasReachedMax = false,
    this.errorMessage = '',
  });

  PhotosOfUserState copyWith({
    PhotoOfUserStatus? status,
    List<PhotosOfUser>? photos,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return PhotosOfUserState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, photos, hasReachedMax, errorMessage];
}
