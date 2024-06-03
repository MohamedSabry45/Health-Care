import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:gp/routes/routes_names.dart';

import '../../../../core/constansts/asset_manger.dart';

class DiagnosisPage extends StatelessWidget {
  const DiagnosisPage({super.key, required this.diagnosis});
  final String diagnosis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.propHeight(15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Modular.to.pushNamed(AppRoutes.home);
                  },
                ),
              ],
            ),
            const SizedBox(height: 70),
            Image.asset(
              AssetManger.onboarding_3,
              width: double.infinity,
              height: context.propHeight(225),
            ),
            Text(
              "Your diagnosis may be.. ",
              style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.yellow,
              thickness: 2,
            ),
            const SizedBox(height: 80),
            Container(
              width: context.propWidth(300),
              height: context.propWidth(90),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 98, 184, 224),
              ),
              child: Center(
                child: Text(
                  diagnosis,
                  style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 110),
            CustomButton(
              title: "Done",
              onPressed: () {
                Modular.to.pushNamed(AppRoutes.home);
              },
              width: context.propWidth(180),
            )
          ],
        ),
      ),
    );
  }
}
