import 'package:crud_jsonplaceholder/src/presentation/bloc/posts/posts_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/post.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<PostRequest>(_onPosRequest);
  }

  final PostRepo _postRepo = PostRepo();

  Future<void> _onPosRequest(
      PostRequest postRequest, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading));
    final Post post = await _postRepo.fetchPost(postRequest.id);
    emit(state.copyWith(status: PostStatus.success, post: post));
  }
}
