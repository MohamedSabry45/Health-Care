import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/auth/data/models/user_model.dart';
import 'package:gp/features/auth/domain/usecases/login_use_case.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> login(LoginParams params);
  Future<Either<Failure, Unit>> register(RegisterParams params);
  Future<Either<Failure, Unit>> forget(String params);
  Future<UserModel> getUser();
}
