import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/auth/domain/repositories/auth_repository.dart';

class ForgetUseCase extends UseCase<Unit, String> {
  final AuthRepository authRepository;

  ForgetUseCase(this.authRepository);

  @override
  Future<Either<Failure, Unit>> call(String params) async {
    return await authRepository.forget(params);
  }
}