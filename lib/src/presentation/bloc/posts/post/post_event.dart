part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class PostRequest extends PostEvent {
  final int id;

  PostRequest({required this.id});
}
