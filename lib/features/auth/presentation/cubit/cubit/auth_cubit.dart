import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/auth/domain/usecases/forget_use_case.dart';
import 'package:gp/features/auth/domain/usecases/login_use_case.dart';
import 'package:gp/features/auth/domain/usecases/register_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ForgetUseCase forgetUseCase;
  // final GetUserUseCase? getUserUseCase;

  AuthCubit(this.loginUseCase, this.registerUseCase, this.forgetUseCase) : super(AuthInitial());
  Future<Either<Failure, Unit>> login(String email, String password) async {
    // emit(AuthLoading());
    final result = await loginUseCase(LoginParams(email: email, password: password));
    return result;
  }

  Future<Either<Failure, Unit>> register(RegisterParams params) async {
    // emit(AuthLoading());
    final result = await registerUseCase(params);
    return result;
  }

  Future<Either<Failure, Unit>> forget(String params) async {
    // emit(AuthLoading());
    final result = await forgetUseCase(params);
    return result;
  }
  
}
