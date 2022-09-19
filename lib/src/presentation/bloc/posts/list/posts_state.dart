part of 'posts_bloc.dart';

enum PostsStatus { hasData, loading, success, error }

class PostsState extends Equatable {
  final List<Post> posts;
  final bool isMax;
  final PostsStatus status;

  const PostsState({
    this.posts = const <Post>[],
    this.isMax = false,
    this.status = PostsStatus.hasData,
  });

  PostsState copyWith({
    List<Post>? posts,
    bool? isMax,
    PostsStatus? status,
  }) {
    return PostsState(
      posts: posts ?? this.posts,
      isMax: isMax ?? this.isMax,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [posts, isMax, status];
}

class PostState extends Equatable {
  final Post? post;
  final int id;

  const PostState({this.post, required this.id});

  PostState copyWith({
    Post? post,
    int? id,
  }) {
    return PostState(
        post: post,
        id: id ?? this.id
    );
  }

  @override
  List<Object?> get props => [id, post];

}
