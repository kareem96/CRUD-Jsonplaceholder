part of 'post_form_cubit.dart';


class PostFormState extends Equatable {
  final String? title;
  final String? body;
  final int? id;

  const PostFormState({this.title = "", this.body = "", this.id});

  PostFormState copyWith({
    String? title,
    String? body,
    int? id,
  }){
    return PostFormState(
      title: title ?? this.title,
      body: body ?? this.body,
      id: id ?? this.id
    );
  }

  @override
  List<Object?> get props => [title, body, id];

}