import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_form_state.dart';

class PostFormCubit extends Cubit<PostFormState>{
  PostFormCubit() : super(const PostFormState());

  void updateId(int id) => emit(state.copyWith(id: id));
  void updateTitle(String? title) => emit(state.copyWith(title: title));
  void updateBody(String? body) => emit(state.copyWith(body: body));

}