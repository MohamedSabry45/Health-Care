import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String title;
  final String msg;

  Failure(this.title, this.msg);
}

class OfflineFailure extends Failure {
  OfflineFailure(super.title, super.msg);

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final String? message;

  ServerFailure({this.message})
      : super('Server Failure', message ?? 'Server Failure');

  @override
  List<Object?> get props => [];
}

class WrongAuthFailure extends Failure {
  WrongAuthFailure({required String title, required String msg})
      : super(title, msg);

  @override
  List<Object?> get props => [title, msg];
}
