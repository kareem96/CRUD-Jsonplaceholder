import 'dart:math';

import 'package:flutter/material.dart';

import '../../../data/model/comment.dart';
import '../users/user_info.dart';

class CommentInfo extends StatefulWidget {
  final Comment comment;

  const CommentInfo({Key? key, required this.comment}) : super(key: key);

  @override
  State<CommentInfo> createState() => _CommentInfoState();
}

class _CommentInfoState extends State<CommentInfo> {
  Random random = Random();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          _buildHeader(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return UserInfo(userId: random.nextInt(10) + 1);
  }

  Widget _buildContent() {
    /*final Mate*/
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.comment.name ?? "",
          ),
          Text(
            widget.comment.body ?? "",
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
