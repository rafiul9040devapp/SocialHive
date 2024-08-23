part of 'comment_bloc.dart';


enum CommentStatus{initial,success,failure}

final class CommentState extends Equatable{

  final CommentStatus status;
  final List<Album> albums;
  final bool hasReachedMax;
  final String errorMessage;

  const CommentState({
    this.status = CommentStatus.initial,
    this.albums = const <Album>[],
    this.hasReachedMax = false,
    this.errorMessage = '',
  });

  CommentState copyWith({
    CommentStatus? status,
    List<Album>? albums,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return CommentState(
      status: status ?? this.status,
      albums: albums ?? this.albums,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }


  @override
  List<Object?> get props => [status,albums,hasReachedMax,errorMessage];

}