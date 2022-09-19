part of 'comment.dart';

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
      id: json['id'] as int,
      postId: json['postId'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String);
}

Map<String, dynamic> _$CommentToJson(Comment comment) => <String, dynamic>{
      'id': comment.id,
      'postId': comment.postId,
      'name': comment.name,
      'email': comment.email,
      'body': comment.body,
    };
