import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/asset_manger.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:gp/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:gp/routes/routes_names.dart';

import 'login_screen.dart';

class ReseteScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ReseteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: HexColor("FFFFFF"),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: HexColor("000000"),
              ),
              onPressed: () {
                Modular.to.pushReplacementNamed(AppRoutes.login);
              })),
      body: Padding(
        padding: EdgeInsets.only(top: 8),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetManger.forget_pass,
                  height: context.propHeight(265),
                  width: context.propWidth(360),
                ),
                SizedBox(
                  height: context.propHeight(50),
                ),
                Text(
                  "Forgot Your Password !",
                  style: context.textTheme.displayMedium?.copyWith(
                    color: HexColor("000000"),
                    fontSize: context.propWidth(22),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: context.propHeight(11),
                ),
                Text(
                  "Enter Your Email Address to Retrieve Your Password",
                  style: context.textTheme.displayMedium?.copyWith(
                    color: HexColor("000000"),
                    fontSize: context.propWidth(12),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: context.propHeight(59),
                ),
                CustomTextField(
                  hintText: "Your Email",
                  width: context.propWidth(296),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  errorText: "Please enter a valid email",
                  validator: (value, errorText) {
                    if (value!.contains('@') && value.contains('.')) {
                      return errorText;
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.propHeight(35)),
                CustomButton(
                  width: context.propHeight(210),
                  height: context.propHeight(25),
                  title: 'Reset Password ',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var either = await Modular.get<AuthCubit>()
                          .forget(emailController.text);
                      either.fold((l) => print(l), (r) => print(r));
                      // Modular.to.pushNamed(RoutesNames.onboarding);
                    }
                  },
                ),
                SizedBox(
                  height: context.propHeight(12),
                ),
                Text(
                  "* A message will be sent to set or reset a new password.",
                  style: context.textTheme.displayMedium?.copyWith(
                    color: HexColor("000000"),
                    fontSize: context.propWidth(10),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
