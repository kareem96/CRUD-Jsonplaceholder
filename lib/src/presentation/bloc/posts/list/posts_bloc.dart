import 'package:crud_jsonplaceholder/src/data/model/post.dart';
import 'package:crud_jsonplaceholder/src/presentation/bloc/posts/posts_repo.dart';
import 'package:crud_jsonplaceholder/src/presentation/cubit/post_form_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostEvent, PostsState>{
  PostsBloc() : super(const PostsState()){
    on<PostsRequest>(_onPostsRequest);
    on<PostsUpdate>(_onPostsUpdate);
    on<PostsAdd>(_onPostsAdd);
    on<PostsDelete>(_onPostsDelete);
  }

  final PostRepo _postRepo = PostRepo();

  Future<void> _onPostsRequest(
      PostsRequest postsRequest,
      Emitter<PostsState> emit,
      )async{
    emit(state.copyWith(status: PostsStatus.loading));
    final List<Post> posts = await _postRepo.fetchPosts();
    emit(state.copyWith(status: PostsStatus.success, posts: posts));
  }

  Future<void> _onPostsAdd(PostsAdd postsAdd, Emitter<PostsState> emit,)async{
    emit(state.copyWith(status: PostsStatus.loading));
    final Post post = await _postRepo.addPost(postsAdd.postFormState);

    // copy previous list and insert new post to first
    final List<Post> newList = state.posts;
    newList.insert(0, post);
    emit(
      state.copyWith(
        status: PostsStatus.success,
        posts: newList
      )
    );
  }

  Future<void> _onPostsUpdate(PostsUpdate postsUpdate, Emitter<PostsState> emit)async{
    emit(state.copyWith(status: PostsStatus.loading));
    final Post post = await _postRepo.editPost(postsUpdate.postFormState);

    //update single item form the list
    state.posts[state.posts.indexWhere((Post p) => p.id == post.id)] = post;

    emit(
      state.copyWith(
        status: PostsStatus.success,
        posts: state.posts,
      ),
    );
  }

  Future<void> _onPostsDelete(PostsDelete postsDelete, Emitter<PostsState> emit)async{
    emit(state.copyWith(status: PostsStatus.loading));
    state.posts.removeAt(state.posts.indexWhere((Post p) => p.id == postsDelete.postId));
    emit(
      state.copyWith(
        status: PostsStatus.success,
        posts: state.posts,
      )
    );
  }
}