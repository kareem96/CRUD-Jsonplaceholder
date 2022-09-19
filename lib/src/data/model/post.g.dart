part of 'post.dart';

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String);
}

Map<String, dynamic> _$PostToJson(Post post) => <String, dynamic>{
      'id': post.id,
      'userId': post.userId,
      'title': post.title,
      'body': post.body,
    };
