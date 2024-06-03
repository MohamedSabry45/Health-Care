import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/routes/binds.dart';
import 'package:gp/routes/modular_routes.dart';

class AppModule extends Module {
  
  @override
  List<Bind<Object>> get binds => modularBinds;

  @override
  List<ModularRoute> get routes => modularRoutes;
}
//clean architecture
// 3 layers
// 1- presentation
// 2- domain
// 3- data
// 1- presentation
// 1-1- ui
// 1-2- state management
// 1-3- navigation
// domain layer
// data layer
// Calls api 
// models  -> data layer
// this layer is responsible for fetching data
// domain layer 
// this layer is responsible for business logic
// use cases 
//repositories Data -> Domain
//entities -> Domain
//class UserModel{
  fromJson(){}
//}
//class User{}
