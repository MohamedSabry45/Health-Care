// import 'package:flutter_modular/flutter_modular.dart';

// import '../routes_names.dart';


// class GuardUserTypeManager extends RouteGuard {
//   GuardUserTypeManager() : super(redirectTo: AppRoutes.v2MyTasks);

//   @override
//   Future<bool> canActivate(String path, ModularRoute route) {
//     final SUser sUser = Modular.get<SUser>();
//     final CNavigation cNavigation = Modular.get<CNavigation>();

//     final bool isManager = sUser.user?.employeeType == EEmployeeType.modeerAmn;

//     if (!isManager) {
//       cNavigation.v2NavBarIndex = 1;
//     }

//     return Future<bool>.value(isManager);
//   }
// }
