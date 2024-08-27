part of 'comment_details_bloc.dart';

enum CommentDetailsStatus { loading, success, failure }

final class CommentDetailsState extends Equatable {
  final CommentDetailsStatus status;
  final Album album;
  final String errorMessage;

  const CommentDetailsState({
    this.status = CommentDetailsStatus.loading,
    this.album = const Album(postId: 0, id: 1, name: '', email: '', body: ''),
    this.errorMessage = '',
  });

  CommentDetailsState copyWith({
    CommentDetailsStatus? status,
    Album? album,
    String? errorMessage,
  }) {
    return CommentDetailsState(
        status: status ?? this.status,
        album: album ?? this.album,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, album, errorMessage];
}
