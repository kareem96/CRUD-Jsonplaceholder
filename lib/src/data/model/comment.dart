import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final int? id;
  final int? postId;
  final String? name;
  final String? email;
  final String? body;

  Comment({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);

}
