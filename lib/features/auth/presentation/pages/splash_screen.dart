// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/asset_manger.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/routes/routes_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      var preferences = await SharedPreferences.getInstance();
      var isFirst = preferences.getBool('first') == null;
      if (isFirst) {
        await preferences.setBool('first', true);
      }
      isFirst==false ? Modular.to.pushReplacementNamed(AppRoutes.login) : Modular.to.pushReplacementNamed(AppRoutes.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashScreenBackground,
      body: Center(
          child: Image.asset(
        AssetManger.logo,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200,
      )),
    );
  }
}
