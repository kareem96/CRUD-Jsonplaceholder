part of 'user_bloc.dart';

abstract class UserEvent extends Equatable{
  const UserEvent();
  @override
  List<Object?> get props => [];
}

class FetchUser extends UserEvent{
  final int userId;

  const FetchUser(this.userId);
}