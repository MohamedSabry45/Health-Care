// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/user/domain/entities/profile_user_parameter.dart';
import 'package:gp/features/user/domain/usecases/get_user_data_usecase.dart';
import 'package:gp/features/user/domain/usecases/update_pass_usecase.dart';
import 'package:gp/features/user/domain/usecases/update_profile_usecase.dart';
import 'package:gp/features/user/domain/usecases/upload_profile_image.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UpdateProfileUsecase updateProfileUsecase;
  final UpdatePasswordUseCase updatePasswordUseCase;
  final GetProifleUseCase getProifleUseCase;
  final UploadProfileImage uploadProfileImage;
  ProfileUserParameter? user;
  UserCubit(
    this.updatePasswordUseCase,
    this.updateProfileUsecase,
    this.getProifleUseCase, this.uploadProfileImage,
  ) : super(UserInitial());
  updatePassword(String password) async {
    var either = await updatePasswordUseCase(password);
    either.fold(
      (l) {
        //show error messsage
      },
      (r) {
        print('Done');
      },
    );
  }

  Future getProfileData() async {
    var either = await getProifleUseCase(NoParams());
    either.fold(
      (l) {
        print(l);
      },
      (r) {
        user = r;
        emit(UserLoaded(r));
      },
    );
  }

  Future<bool> updateProfile(ProfileUserParameter user) async {
    var either = await updateProfileUsecase(user);
    return either.fold(
      (l) {
        return false;
        //show error messsage
      },
      (r) {
        print('Done');
        return true;
      },
    );
  }

  Future<void> logout() async{
   await FirebaseAuth.instance.signOut();
    user = null;
    emit(UserInitial());
  }
  Future<bool> uploadImage(File file)async{
    emit(UserInitial());
    var either = await uploadProfileImage(file);
    
    return either.fold((l) {
      // emit(ReportsError());
      return false;
    }, (r) {
      getProfileData();
      return true;
    });
  }
}

//create new feature

//update password
