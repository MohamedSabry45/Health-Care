import 'package:gp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gp/features/auth/data/datasources/auth_datasource.dart';
import 'package:gp/features/auth/data/models/user_model.dart';
import 'package:gp/features/auth/domain/repositories/auth_repository.dart';
import 'package:gp/features/auth/domain/usecases/login_use_case.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);
  @override
  Future<Either<Failure, Unit>> login(LoginParams params) async {
    return await authDataSource.login(params);
  }

  @override
  Future<Either<Failure, Unit>> register(RegisterParams params) async {
   
    return await authDataSource.regester(params);
  }

  @override
  Future<Either<Failure, Unit>> forget(String params) async {
    // TODO: implement register
    return await authDataSource.forget(params);
  }

  @override
  Future<UserModel> getUser() async {
    var map = await authDataSource.getUser();
    UserModel user = UserModel.fromJson(map);
    //  UserModel(id: map['id'], name: map['name'], email: email)
    return user;
  }
}
