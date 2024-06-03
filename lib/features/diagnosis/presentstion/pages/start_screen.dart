import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:gp/routes/routes_names.dart';

import '../../../../core/constansts/asset_manger.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Image.asset(
              AssetManger.onboarding_3,
              width: double.infinity,
              height: context.propHeight(225),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.yellow,
              thickness: 2,
            ),
            const SizedBox(height: 35),
            const Text(
              "this application will help you to Discover what disease you may have based on your symptoms",
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 18,
                fontWeight: FontWeight.w200,
                color: Color.fromARGB(244, 26, 21, 21),
                // decoration: null,
              ),
            ),
            const SizedBox(height: 100),
            CustomButton(
              onPressed: () {
                Modular.to.pushNamed(AppRoutes.diagnosisChoices);
              },
              title: "Lets Start",
              height: context.propHeight(49),
              width: context.propWidth(200),
            )
          ],
        ),
      ),
    );
  }
}
