part of 'user_bloc.dart';

enum UserStatus { hasData, loading, success, failure }

class UserState extends Equatable {
  final User? user;
  final UserStatus status;

  const UserState({this.user, this.status = UserStatus.hasData});

  UserState copyWith({
    User? user,
    UserStatus? status,
  }){
    return UserState(
      user: user,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [user, status];

}
