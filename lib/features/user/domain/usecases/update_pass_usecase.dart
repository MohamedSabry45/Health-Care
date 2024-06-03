import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/user/domain/repositories/user_repo.dart';

class UpdatePasswordUseCase extends UseCase<Unit, String> {
  final UserRepositroy userRepositroy;

  UpdatePasswordUseCase(this.userRepositroy);
  // UserRepositroy(this.)

  @override
  Future<Either<Failure, Unit>> call( params) {
    return userRepositroy.updatePassword(params);
  }
}
// final UserRepositroy userRepositroy=UserRepositroyImpl();