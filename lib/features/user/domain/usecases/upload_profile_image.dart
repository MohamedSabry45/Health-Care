import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/user/domain/repositories/user_repo.dart';

class UploadProfileImage extends UseCase<Unit,File>{
  final UserRepositroy userRepositroy;

  UploadProfileImage(this.userRepositroy);

  @override
  Future<Either<Failure, Unit>> call(File params) {
    return userRepositroy.updateImage(params);
  }
  
    
}