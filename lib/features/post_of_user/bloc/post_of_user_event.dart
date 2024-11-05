part of 'post_of_user_bloc.dart';

sealed class PostOfUserEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class FetchPostOfUserEvent extends PostOfUserEvent{
  final int profileId;
  FetchPostOfUserEvent({required this.profileId});
  @override
  List<Object?> get props => [profileId];
}