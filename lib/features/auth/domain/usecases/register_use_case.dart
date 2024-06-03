import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/auth/domain/repositories/auth_repository.dart';
import 'package:gp/features/auth/domain/usecases/login_use_case.dart';

class RegisterUseCase extends UseCase<Unit, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, Unit>> call(RegisterParams params) async {
    return await authRepository.register(params);
  }
}