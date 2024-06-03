import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/user/domain/entities/profile_user_parameter.dart';

abstract class UserRepositroy {
  Future<Either<Failure, Unit>> updatePassword(String newPassword);

  Future<Either<Failure, Unit>> updateProfile(ProfileUserParameter params) ;
  Future<Either<Failure, ProfileUserParameter>> getProfileData() ;
  Future<Either<Failure, Unit>> updateImage(File image) ;

  

}
