part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthSignInSucessfuly extends AuthState {}

class AuthSignInLoading extends AuthState {}

class AuthSignInFailed extends AuthState {}
