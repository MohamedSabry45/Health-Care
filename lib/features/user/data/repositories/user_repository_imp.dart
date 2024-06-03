import 'dart:io';

import 'package:gp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:gp/features/user/data/datasources/user_data_source.dart';
import 'package:gp/features/user/domain/entities/profile_user_parameter.dart';
import 'package:gp/features/user/domain/repositories/user_repo.dart';

class UserRepositroyImpl implements UserRepositroy {
  final UserDataSource userDataSource;

  UserRepositroyImpl(this.userDataSource);
  @override
  Future<Either<Failure, Unit>> updatePassword(String newPassword) {
    return userDataSource.updatePassword(newPassword);
  }
  @override
  Future<Either<Failure, Unit>>  updateProfile(ProfileUserParameter user){
    return userDataSource.updateProfile(user);
  }
  
  @override
  Future<Either<Failure, ProfileUserParameter>> getProfileData() {
    return userDataSource.getProfileData();
  }

  @override
  Future<Either<Failure, Unit>> updateImage(File image) {
    return userDataSource.updateImage(image);
  }
}
