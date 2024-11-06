part of 'albums_of_user_bloc.dart';

sealed class AlbumsOfUseEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class FetchAllAlbumsOfUserEvent extends AlbumsOfUseEvent{
  final int profileId;

  FetchAllAlbumsOfUserEvent({required this.profileId});

  @override
  List<Object?> get props => [profileId];
}