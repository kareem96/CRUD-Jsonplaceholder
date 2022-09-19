import 'package:crud_jsonplaceholder/src/data/model/post.dart';
import 'package:crud_jsonplaceholder/src/data/services/api_service.dart';
import 'package:crud_jsonplaceholder/src/presentation/cubit/post_form_cubit.dart';

class PostRepo{
  PostRepo._constructor();
  final ApiServices _apiServices = ApiServices();
  static final PostRepo _instance = PostRepo._constructor();
  factory PostRepo(){
    return _instance;
  }
  Future<Post> addPost(PostFormState postFormState) async => _apiServices.addPost(postFormState);
  Future<Post> editPost(PostFormState postFormState) async => _apiServices.editPost(postFormState);
  Future<List<Post>> fetchPosts() async => _apiServices.fetchPosts();
  Future<Post> fetchPost(int id) async => _apiServices.fetchPost(id);
}