// ignore_for_file: implementation_imports, duplicate_ignore, depend_on_referenced_packages

import 'package:flutter_modular/flutter_modular.dart'; // ignore: depend_on_referenced_packages, implementation_imports
import 'package:gp/features/archive/domain/entity/disease.dart';
import 'package:gp/features/archive/presentation/pages/add_diseases_screen.dart';
import 'package:gp/features/archive/presentation/pages/editnormal_screen.dart';
import 'package:gp/features/archive/presentation/pages/normal_screen.dart';
import 'package:gp/features/archive/presentation/pages/upload_screen.dart';
import 'package:gp/features/auth/presentation/pages/create_screan.dart';
import 'package:gp/features/auth/presentation/pages/login_screen.dart';
import 'package:gp/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:gp/features/auth/presentation/pages/splash_screen.dart';
import 'package:gp/features/diagnosis/presentstion/pages/choices_screen.dart';
import 'package:gp/features/user/domain/entities/profile_user_parameter.dart';
import 'package:gp/routes/guards/auth_guard.dart';
import 'package:gp/routes/routes_names.dart';
import 'package:modular_interfaces/src/route/modular_arguments.dart';

import '../features/archive/presentation/pages/archive_screen.dart';
import '../features/archive/presentation/pages/diseases_screen.dart';
import '../features/archive/presentation/pages/reports_screen.dart';
import '../features/auth/presentation/pages/resete_screen.dart';
import '../features/diagnosis/presentstion/pages/diagnosis_screen.dart';
import '../features/diagnosis/presentstion/pages/start_screen.dart';
import '../features/home/presentstion/pages/home_screen.dart';
import '../features/profile/presentstion/pages/editprofile_screen.dart';
import '../features/profile/presentstion/pages/profie_screen.dart';

List<ModularRoute> modularRoutes = <ChildRoute<dynamic>>[
  ChildRoute<dynamic>(
    AppRoutes.start,
    child: (_, ModularArguments args) => const SplashScreen(),
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.onBoarding,
    child: (_, ModularArguments args) => const OnboardingScreen(),
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(AppRoutes.login,
      child: (_, ModularArguments args) => LoginScreen(),
      transition: TransitionType.fadeIn,
      guards: [AuthGuard()]),
  ChildRoute<dynamic>(
    AppRoutes.resete,
    child: (_, ModularArguments args) => ReseteScreen(),
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.create,
    child: (_, ModularArguments args) => CreateScreen(),
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.home,
    child: (_, ModularArguments args) =>  HomeScreen(),
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.profile,
    child: (_, ModularArguments args) => const ProfileScreen(),
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.editprofile,
    child: (_, ModularArguments args) =>  EditProfileScreen(profileUserParameter: args.data as ProfileUserParameter ,),
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.archive,
    child: (_, ModularArguments args) => const ArchiveScreen(),
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.diagnosisStart,
    child: (_, ModularArguments args) => const StartPage(),
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.diagnosisChoices,
    child: (_, ModularArguments args) => const ChoicesScreen(),
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.DiagnosisPage,
    child: (_, ModularArguments args) =>  DiagnosisPage(
      diagnosis: args.data as String,
  
    ),
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.diseasesPage,
    child: (_, ModularArguments args) {
      var type = args.data as String;
      return DiseasesScreen(
        type: type,
      );
    },
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.normal,
    child: (_, ModularArguments args) {
      var object= args.data as Disease;
      return  NornalPage(disease: object,);
    },
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.editNormal,
    child: (_, ModularArguments args) {

      return EditNormalScreen(  disease: args.data as Disease,);
    },
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.addNormal,
    child: (_, ModularArguments args) {
      var type = args.data as String;
      return AddNormalScreen(
        type: type,
      );
    },
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.upload,
    child: (_, ModularArguments args) => const UploadScreen(),
    transition: TransitionType.fadeIn,
  ),
  ChildRoute<dynamic>(
    AppRoutes.reportsPage,
    child: (_, ModularArguments args) => const ReportsScreen(),
    transition: TransitionType.fadeIn,
  ),

  // ChildRoute<dynamic>(
  //   AppRoutes.upload,
  //   child: (_, ModularArguments args) => const UploadScreen(),
  //   transition: TransitionType.fadeIn,
  // ),
];
