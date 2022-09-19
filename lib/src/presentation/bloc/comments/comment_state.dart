part of 'comment_bloc.dart';

enum CommentStatus { hasData, loading, success, error }

class CommentState extends Equatable {
  final List<Comment> comment;
  final CommentStatus status;

  CommentState(
      {this.comment = const <Comment>[], this.status = CommentStatus.hasData});

  CommentState copyWith({List<Comment>? comment, CommentStatus? status}) {
    return CommentState(
      comment: comment ?? this.comment,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [comment, status];
}
