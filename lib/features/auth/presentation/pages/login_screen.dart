import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/asset_manger.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:gp/features/auth/presentation/pages/onboarding_screen.dart';

import '../../../../routes/routes_names.dart';
// import 'flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.propWidth(27),
          vertical: context.propHeight(60),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We're Back !",
                  style: context.textTheme.displayMedium?.copyWith(
                    // color: context.theme.colorScheme.onBackground,
                    color: HexColor("4F79E4"),
                    fontSize: context.propWidth(30),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Image.asset(
                  AssetManger.login,
                  // color: Colors.red,
                  height: context.propHeight(300),
                  width: context.propWidth(300),
                ),
                CustomTextField(
                  hintText: "Email Address",
                  // height: context.propHeight(50),
                  width: context.propWidth(300),
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
                SizedBox(height: context.propHeight(20)),
                CustomTextField(
                  hintText: "Password",
                  // height: context.propHeight(50),
                  width: context.propWidth(300),
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  errorText: "Please enter a valid password",
                  validator: (value, errorText) {
                    if (value!.isEmpty) {
                      return errorText;
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Modular.to.pushReplacementNamed(AppRoutes.resete);
                    },
                    child: Text(
                      "Forgot Password",
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.propHeight(20)),
                CustomButton(
                  title: 'Login',
                  onPressed: () async {
                    var cubit = Modular.get<AuthCubit>();
                    var login = await cubit.login(
                        emailController.text, passwordController.text);
                    login.fold((l) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l.msg),
                        ),
                      );
                    }, (r) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      // SnackBar(
                      //  content: Text('success'),
                      // ),
                      // );
                      Modular.to.pushReplacementNamed(AppRoutes.home);
                    });
                  },
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Modular.to.pushReplacementNamed(AppRoutes.create);
                    },
                    child: Text(
                      "Don’t  have an account ? Sign Up ",
                      style: context.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
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

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Icon? suffixIcon;
  final double? height;
  final double? width;
  final bool? disabled;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? errorText;
  final String? Function(String? value, String? errorText)? validator;

  const CustomTextField({
    
    super.key,
    this.disabled,
    this.hintText,
    this.height,
    this.width,
    this.controller,
    this.obscureText,
    this.keyboardType,
    this.errorText,
    this.validator,
    this.suffixIcon,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(
        vertical: context.propHeight(5),
      ),
      decoration: BoxDecoration(
        //shaddow effect for bottom
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        enabled: disabled ?? true,
        controller: controller,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return errorText;
        //   }if(validator != null){
        //     return validator!(value, errorText);
        //   }
        // },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: context.propWidth(20),
            vertical: context.propHeight(20),
          ),
          hintText: hintText,
          hintStyle: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.primaryColor.withOpacity(0.5),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 30,
              color: Colors.blue,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          labelText: labelText,
        ),
      ),
    );
  }
}
