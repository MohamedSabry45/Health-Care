import 'package:gp/features/auth/domain/entites/user.dart';
import 'package:gp/features/auth/domain/repositories/auth_repository.dart';

class GetUserUseCase {
  final AuthRepository authRepository;
  GetUserUseCase(this.authRepository);

  Future<User> call(params) async {
    // TODO: implement call
    return await authRepository.getUser();
    // return user;
  }
  // @override
  // Future<User> call(Params params) async {
  //   return await authRepository.getUser();
  // }
}
