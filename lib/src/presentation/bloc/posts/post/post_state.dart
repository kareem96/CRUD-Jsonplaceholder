part of 'post_bloc.dart';

enum PostStatus { hasData, loading, success, error }

class PostState extends Equatable {
  final Post? post;
  final int? id;
  final PostStatus status;

  const PostState({this.post, this.id, this.status = PostStatus.hasData});

  PostState copyWith({
    Post? post,
    int? id,
    PostStatus? status,
  }) {
    return PostState(post: post, id: id, status: status ?? this.status);
  }

  @override
  List<Object?> get props => [id, post, status];
}
