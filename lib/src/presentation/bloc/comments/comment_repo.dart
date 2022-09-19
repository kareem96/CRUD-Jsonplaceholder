import 'package:crud_jsonplaceholder/src/data/model/comment.dart';
import 'package:crud_jsonplaceholder/src/data/services/api_service.dart';

class CommentRepo{
  static final CommentRepo _instance = CommentRepo._constructor();
  final ApiServices _apiServices = ApiServices();
  factory CommentRepo(){
    return _instance;
  }
  CommentRepo._constructor();
  Future<List<Comment>> fetchCommnets(int postId) async => _apiServices.fetchComment(postId);

}