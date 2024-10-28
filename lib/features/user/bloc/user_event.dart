part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FetchUserEvent extends UserEvent {
  final String userEmail;

  FetchUserEvent({required this.userEmail});

  @override
  List<Object?> get props => [userEmail];
}
