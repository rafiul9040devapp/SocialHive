part of 'photos_of_user_bloc.dart';

sealed class PhotosOfUserEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class FetchAllPhotosOfUser extends PhotosOfUserEvent{
  final int profileId;
  FetchAllPhotosOfUser({required this.profileId});
  @override
  List<Object?> get props => [profileId];
}