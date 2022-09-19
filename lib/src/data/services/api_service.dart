import 'package:crud_jsonplaceholder/src/data/model/comment.dart';
import 'package:crud_jsonplaceholder/src/data/model/post.dart';
import 'package:crud_jsonplaceholder/src/data/model/user.dart';
import 'package:crud_jsonplaceholder/src/presentation/cubit/post_form_cubit.dart';
import 'package:dio/dio.dart';

class ApiServices{
  /*GET Comment*/
  Future<List<Comment>> fetchComment(int postId) async{
    try{
      final response = await Dio().get('https://jsonplaceholder.typicode.com/comments?postId=$postId');
      final data = response.data as List;
      List<Comment> comment = List<Comment>.from(data.map((e) => Comment.fromJson(e as Map<String, dynamic>)));
      return comment;
    }on DioError catch(e){
      throw Exception(e.error);
    }
  }

  /*GET Posts*/
  Future<List<Post>> fetchPosts() async {
    try {
      final response =
      await Dio().get('https://jsonplaceholder.typicode.com/posts');
      final data = response.data as List;
      List<Post> posts = List<Post>.from(
          data.map((i) => Post.fromJson(i as Map<String, dynamic>)));
      return posts;
    } on DioError catch (e) {

      throw Exception(e.error);
    }
  }

  Future<Post> fetchPost(int id) async{
    try{
      final response = await Dio().get("https://jsonplaceholder.typicode.com/posts/$id");
      final data = response.data;
      Post post = Post.fromJson(data as Map<String, dynamic>);
      return post;
    }on DioError catch(e){
      throw Exception(e.error);
    }
  }

  /* POST/CREATE Post */
  Future<Post> addPost(PostFormState post) async {
    try {
      final response =
      await Dio().post('https://jsonplaceholder.typicode.com/posts', data: {
        "title": post.title,
        "body": post.body,
        "userId": 1,
      });
      final data = response.data;
      final Post createPost = Post.fromJson(data as Map<String, dynamic>);
      return createPost;
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }

  /* PUT/EDIT Post */
  Future<Post> editPost(PostFormState post) async {
    try {
      final response =
      await Dio().put('https://jsonplaceholder.typicode.com/posts${post.id}', data: {
        "title": post.title,
        "body": post.body,
        "userId": 1,
      });
      final data = response.data;
      final Post editPost = Post.fromJson(data as Map<String, dynamic>);
      return editPost;
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }

  Future<User> fetchUser(int id)async{
    try{
      final response = await Dio().get('https://jsonplaceholder.typicode.com/users/$id');
      final data = response.data;
      User user = User.fromJson(data as Map<String, dynamic>);
      return user;
    }on DioError catch(e){
      throw Exception(e.error);
    }
  }
}