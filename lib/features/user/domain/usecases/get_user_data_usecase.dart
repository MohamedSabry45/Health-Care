import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/user/domain/entities/profile_user_parameter.dart';
import 'package:gp/features/user/domain/repositories/user_repo.dart';

class GetProifleUseCase extends UseCase<ProfileUserParameter, NoParams> {
  final UserRepositroy profileUserParameter;

  GetProifleUseCase(this.profileUserParameter);
  @override
  Future<Either<Failure, ProfileUserParameter>> call(NoParams params) async {
    return await profileUserParameter.getProfileData();
  }
}
