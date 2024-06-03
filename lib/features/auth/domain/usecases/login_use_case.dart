import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<Unit, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, Unit>> call(LoginParams params) async {
    return await authRepository.login(params);
  }
}
class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
class RegisterParams extends LoginParams{
  final String name ;
  RegisterParams({required super.email, required super.password,required this.name});
   
}