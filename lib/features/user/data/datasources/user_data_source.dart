import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/user/domain/entities/profile_user_parameter.dart';

abstract class UserDataSource {
  Future<Either<Failure, Unit>> updatePassword(String password);

  Future<Either<Failure, Unit>> updateProfile(ProfileUserParameter user);

  Future<Either<Failure, ProfileUserParameter>> getProfileData();

  Future<Either<Failure, Unit>> updateImage(File image) ;
}
