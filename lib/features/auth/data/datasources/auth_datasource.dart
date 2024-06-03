import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';

import '../../domain/usecases/login_use_case.dart';

abstract class AuthDataSource {
  Future<Either<Failure, Unit>> login(LoginParams params);
  Future<Either<Failure, Unit>> regester(RegisterParams params);
  Future<Either<Failure, Unit>> forget(String email);
  Future<Map<String,dynamic>> getUser();
  
}