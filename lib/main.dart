import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/asset_manger.dart';
import 'package:gp/core/theme/app_Theme.dart';
import 'package:gp/features/archive/presentation/cubit/archive_cubit.dart';
import 'package:gp/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:gp/features/diagnosis/presentstion/cubit/diagnosis_cubit.dart';
import 'package:gp/features/reports/presentation/cubit/reports_cubit.dart';
import 'package:gp/features/user/presentation/cubit/user_cubit.dart';
import 'package:gp/firebase_options.dart';
import 'package:gp/routes/module.dart';

Future<void> main() async {
  AssetManger.logo;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // extractInformation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => Modular.get<AuthCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (context) => Modular.get<UserCubit>(),
        ),
        BlocProvider<DiagnosisCubit>(
          create: (context) => Modular.get<DiagnosisCubit>(),
        ),
        BlocProvider<ArchiveCubit>(
          create: (context) => Modular.get<ArchiveCubit>(),
        ), BlocProvider<ReportsCubit>(
          create: (context) => Modular.get<ReportsCubit>(),
        ),
      ],
      child: ModularApp(
          // debugMode: false,

          module: AppModule(),
          child: MaterialApp.router(

            theme: AppTheme().theme,
            debugShowCheckedModeBanner: false,
            routerDelegate: Modular.routerDelegate,
            routeInformationParser: Modular.routeInformationParser,
          )),
    );
  }
}
