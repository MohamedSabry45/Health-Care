import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/user/data/datasources/user_data_source.dart';
import 'package:gp/features/user/domain/entities/profile_user_parameter.dart';

class UserDataSourceImpl implements UserDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;
  UserDataSourceImpl(this.firebaseAuth, this.firebaseFirestore, this.firebaseStorage);
  @override
  Future<Either<Failure, Unit>> updatePassword(String password) async {
    try {
      await firebaseAuth.currentUser?.updatePassword(password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(ServerFailure(message: "password is weak"));
      } else if (e.code == 'requires-recent-login') {
        return left(ServerFailure(message: "Require Recent-login"));
      }
    }
    return left(OfflineFailure('Network not Avaliable', 'try Again'));
  }

  @override
  Future<Either<Failure, Unit>> updateProfile(ProfileUserParameter user) async {
    try {
      var updateParameters = <Object, Object?>{};
      if (user.name != null) {
        updateParameters['name'] = user.name;
      } if (user.age != null) {
        updateParameters['age'] = user.age;
      }
      if (user.email != null) {
        updateParameters['email'] = user.email;
      }
      if (user.phone != null) {
        updateParameters['phone'] = user.phone;
      }
      if (user.photoUrl != null) {
        updateParameters['photoUrl'] = user.photoUrl;
      }
      if (user.bloodType != null) {
        updateParameters['bloodType'] = user.bloodType;
      }
      if(user.gender!=null){
        updateParameters['gender']=user.gender;
      }
      var doc = firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid);
      //ensure that the user is exist
      var docSnap = await doc.get();
      if (!docSnap.exists) {
        var newMap = <String, dynamic>{};
        newMap = updateParameters.cast<String, dynamic>();
        await doc.set(newMap);
        return right(unit);
      } else {
        await doc.update(updateParameters);
        return right(unit);
      }
    } on Exception catch (e) {
      print(e);
      return left(ServerFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, ProfileUserParameter>> getProfileData() async{
    var res =await firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).get();
    if(res.exists){
      var map = res.data() as Map<String,dynamic>;
      var user = ProfileUserParameter.fromMap(map);
      return right(user);
  }
  else{
    return right(ProfileUserParameter());
  }
}

  @override
  Future<Either<Failure, Unit>> updateImage(File image) async{
    //upload image to firebase storage
    try{
      var ref = firebaseStorage.ref('users/${firebaseAuth.currentUser!.uid}/profileImage');
      var uploadTask = ref.putFile(image);
      var snapshot = await uploadTask.whenComplete(() => null);
      var url = await snapshot.ref.getDownloadURL();
      //update user profile
      await firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).update({'photoUrl':url});
      return right(unit);
    }
    on Exception catch(e){
      print(e);
      return left(ServerFailure(message: e.toString()));
    }
  }
}