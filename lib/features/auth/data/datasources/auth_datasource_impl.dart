import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/auth/data/datasources/auth_datasource.dart';
import 'package:gp/features/auth/domain/usecases/login_use_case.dart';

class AuthDataSourceImpl implements AuthDataSource {
  FirebaseAuth firebaseAuth;
  AuthDataSourceImpl(this.firebaseAuth);
  @override
  Future<Map<String,dynamic>> getUser() async {
    /// get user from firebase auth
    return {};
  }

  Future<Either<Failure, Unit>> login(LoginParams params) async {
    try {
      var result = await firebaseAuth.signInWithEmailAndPassword(email: params.email, password: params.password);
      if (result.user != null) {
        return right(unit);
      } else {
        return left(WrongAuthFailure(msg: 'Something went wrong', title: 'Login Failed'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(WrongAuthFailure(msg: 'No user found for that email.', title: 'Login Failed'));
      } else if (e.code == 'wrong-password') {
        return left(WrongAuthFailure(msg: 'Wrong password provided for that user.', title: 'Login Failed'));
      }
    } catch (e) {
      return left(WrongAuthFailure(msg: 'Something went wrong', title: 'Login Failed'));
    }
    return left(WrongAuthFailure(msg: 'Something went wrong', title: 'Login Failed'));
  }

  @override
  Future<Either<Failure, Unit>> regester(RegisterParams params) async {
    try {
      var userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(email: params.email, password: params.password);
      if (userCredential.user != null) {
        return right(unit);
      }
    } on FirebaseAuthException catch (e) {
      //validation
      if (e.code == 'weak-password') {
        return left(WrongAuthFailure(msg: 'The password provided is too weak.', title: 'Regester Failed'));
      } else if (e.code == 'email-already-in-use') {
        return left(WrongAuthFailure(msg: 'The account already exists for that email.', title: 'Regester Failed'));
      }
    }
    return left(WrongAuthFailure(msg: 'Something went wrong', title: 'Regester Failed'));
  }

  @override
  Future<Either<Failure, Unit>> forget(String email) async {
    //implement forget password with firebase auth and handle errors
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(WrongAuthFailure(msg: 'No user found for that email.', title: 'Forget Password Failed'));
      }
    } catch (e) {
      return left(WrongAuthFailure(msg: 'Something went wrong', title: 'Forget Password Failed'));
    }
    return left(WrongAuthFailure(msg: 'Something went wrong', title: 'Forget Password Failed'));
  }
}
