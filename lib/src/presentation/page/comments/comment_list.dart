import 'package:crud_jsonplaceholder/src/data/model/comment.dart';
import 'package:crud_jsonplaceholder/src/presentation/page/comments/comment_info.dart';
import 'package:flutter/material.dart';

class CommentList extends StatelessWidget {
  const CommentList({Key? key, required this.comments}) : super(key: key);
  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (BuildContext content, int index) {
        return const Divider();
      },
      itemCount: comments.length,
      itemBuilder: (BuildContext context, int index) {
        final Comment comment = comments[index];
        return CommentInfo(comment: comment);
      },
    );
  }
}
