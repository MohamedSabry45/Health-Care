part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}
class UserLoading extends UserState {}
class UserLoaded extends UserState {
  final ProfileUserParameter user;

  const UserLoaded(this.user);
}
class UserError extends UserState {
  final String message;

  const UserError(this.message);
}

