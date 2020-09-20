part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserExisted extends UserState {
  final User user;

  const UserExisted({this.user});

  @override
  List<Object> get props => [user];
}

class UserNotExisted extends UserState {}
