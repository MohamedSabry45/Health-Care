import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/routes/routes_names.dart';

class AuthGuard extends RouteGuard {
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
   var user = FirebaseAuth.instance.currentUser;
    if(user == null){
      return true;
    }else{
      //naviage to home page  
      Modular.to.navigate(AppRoutes.home);
      return false;
    }
  }
 
}
