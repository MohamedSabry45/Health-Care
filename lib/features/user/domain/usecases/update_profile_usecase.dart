import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/user/domain/entities/profile_user_parameter.dart';
import 'package:gp/features/user/domain/repositories/user_repo.dart';

class UpdateProfileUsecase extends UseCase<Unit,ProfileUserParameter>{
  final UserRepositroy userRepositroy;

  UpdateProfileUsecase(this.userRepositroy);
  @override
  Future<Either<Failure, Unit>> call(ProfileUserParameter params) {
    return userRepositroy.updateProfile(params);
  }

}