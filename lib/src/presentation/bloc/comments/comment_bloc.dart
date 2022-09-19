import 'package:crud_jsonplaceholder/src/data/model/comment.dart';
import 'package:crud_jsonplaceholder/src/presentation/bloc/comments/comment_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'comment_state.dart';

part 'comment_event.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepo _commentRepo = CommentRepo();

  CommentBloc() : super(CommentState()) {
    on<FetchComment>(_loadComment);
  }

  Future<void> _loadComment(
      FetchComment event, Emitter<CommentState> emit) async {
    try {
      emit(state.copyWith(status: CommentStatus.loading));
      final List<Comment> comment =
          await _commentRepo.fetchCommnets(event.postId);
      emit(state.copyWith(status: CommentStatus.success, comment: comment));
    } catch (e) {
      emit(state.copyWith(status: CommentStatus.error));
    }
  }
}
