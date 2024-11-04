part of 'user_list_bloc.dart';

enum UserListStatus { initial, loading, success, failure }

class UserListState extends Equatable {
  final UserListStatus status;
  final List<UserProfile> profiles;
  final String errorMessage;

  const UserListState({
    this.status = UserListStatus.initial,
    this.profiles = const <UserProfile>[],
    this.errorMessage = '',
  });

  UserListState copyWith({
    UserListStatus? status,
    List<UserProfile>? profiles,
    String? errorMessage,
  }) {
    return UserListState(
      status: status ?? this.status,
      profiles: profiles ?? this.profiles,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, profiles, errorMessage];
}
