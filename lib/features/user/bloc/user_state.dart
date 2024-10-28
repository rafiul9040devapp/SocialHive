part of 'user_bloc.dart';

enum UserStatus { initial, success, failure }

final class UserState extends Equatable {
  final UserStatus status;
  final List<User> userList;
  final String errorMessage;

  const UserState(
      {this.status = UserStatus.initial,
      this.userList = const <User>[],
      this.errorMessage = ''});

  UserState copyWith({
    UserStatus? status,
    List<User>? userList,
    String? errorMessage,
  }) {
    return UserState(
        status: status ?? this.status,
        userList: userList ?? this.userList,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, userList, errorMessage];
}
