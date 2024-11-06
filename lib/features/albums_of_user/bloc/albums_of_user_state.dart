part of 'albums_of_user_bloc.dart';

enum AlbumsOfUserStatus { initial, loading, success, failure }

class AlbumsOfUserState extends Equatable {
  final AlbumsOfUserStatus status;
  final List<AlbumsOfUser> albumsOfUser;
  final String errorMessage;

  const AlbumsOfUserState({
    this.status = AlbumsOfUserStatus.initial,
    this.albumsOfUser = const <AlbumsOfUser>[],
    this.errorMessage = '',
  });

  AlbumsOfUserState copyWith({
    AlbumsOfUserStatus? status,
    List<AlbumsOfUser>? albums,
    String? error,
  }) {
    return AlbumsOfUserState(
        status: status ?? this.status,
        albumsOfUser: albums ?? albumsOfUser,
        errorMessage: error ?? errorMessage);
  }

  @override
  List<Object?> get props => [status, albumsOfUser, errorMessage];
}
