import 'package:crud_jsonplaceholder/src/presentation/bloc/users/users_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/user.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<FetchUser>(_loadUser);
  }

  final UserRepo _userRepo = UserRepo();

  Future<void> _loadUser(FetchUser fetchUser, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(status: UserStatus.loading));
      final User user = await _userRepo.fetchUser(fetchUser.userId);
      emit(state.copyWith(status: UserStatus.success, user: user));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.failure));
    }
  }
}
