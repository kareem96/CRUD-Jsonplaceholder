part of 'posts_bloc.dart';

@immutable
abstract class PostEvent{}
class PostsRequest extends PostEvent{}

class PostsUpdate extends PostEvent{
  final PostFormState postFormState;
  PostsUpdate(this.postFormState);
}

class PostsAdd extends PostEvent{
  final PostFormState postFormState;
  PostsAdd(this.postFormState);
}

class PostsDelete extends PostEvent{
  final int postId;

  PostsDelete(this.postId);

}