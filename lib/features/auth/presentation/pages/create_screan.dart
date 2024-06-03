import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/features/auth/domain/usecases/login_use_case.dart';
import 'package:gp/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:gp/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:gp/routes/routes_names.dart';

import 'login_screen.dart';

class CreateScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  CreateScreen({super.key});

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
            padding: EdgeInsets.symmetric(
              vertical: context.propHeight(60),
              horizontal: context.propHeight(27),
            ),
            child: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create \n your account safely",
                          style: context.textTheme.displayMedium?.copyWith(
                            color: HexColor("4F79E4"),
                            fontSize: context.propWidth(24),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: context.propHeight(16),
                        ),
                        Text(
                          "Please enter your information correctly",
                          style: context.textTheme.displayMedium?.copyWith(
                            color: HexColor("000000"),
                            fontSize: context.propWidth(12),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: context.propHeight(42),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Column(
                            children: [
                              CustomTextField(
                                hintText: "Full Name",
                                width: context.propWidth(296),
                                height: context.propWidth(42),
                                controller: fullNameController,
                                keyboardType: TextInputType.text,
                                errorText: "Please enter a valid name",
                                validator: (value, errorText) {
                                  if (value!.isEmpty) {
                                    return errorText;
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: context.propHeight(39),
                              ),
                              CustomTextField(
                                hintText: "Email",
                                width: context.propWidth(296),
                                height: context.propWidth(42),
                                controller: emailController,
                                keyboardType: TextInputType.text,
                                errorText: "Please enter a valid Email ",
                                validator: (value, errorText) {
                                  if (value!.isEmpty) {
                                    return errorText;
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: context.propHeight(39),
                              ),
                              CustomTextField(
                                hintText: "Enter Password",
                                width: context.propWidth(296),
                                height: context.propWidth(42),
                                controller: passWordController,
                                keyboardType: TextInputType.text,
                                errorText: "Please enter a valid password ",
                                validator: (value, errorText) {
                                  if (value!.isEmpty) {
                                    return errorText;
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: context.propHeight(39),
                              ),
                              CustomTextField(
                                hintText: "Confirm Password",
                                width: context.propWidth(296),
                                height: context.propWidth(42),
                                // controller: ,
                                keyboardType: TextInputType.text,
                                errorText: " ",
                                validator: (value, errorText) {
                                  if (value!.isEmpty) {
                                    return errorText;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.propHeight(77),
                        ),
                        CustomButton(
                          width: context.propHeight(337),
                          height: context.propHeight(49),
                          title: 'Sign Up ',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              var authCubit = Modular.get<AuthCubit>();
                              var either = await authCubit.register(
                                  RegisterParams(
                                      email: emailController.text,
                                      password: passWordController.text,
                                      name: fullNameController.text));
                              either.fold((l) {
                                print('object');
                                // return null;
                                print("${l}error");
                              }, (r) {
                                print('object');
                                Modular.to
                                    .pushReplacementNamed(AppRoutes.login);
                                return null;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: context.propHeight(16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 55,
                          ),
                          child: Text(
                            "Already have an account ? Sign In ",
                            style: context.textTheme.displayMedium?.copyWith(
                              color: HexColor("000000"),
                              fontSize: context.propWidth(14),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )))));
  }
}
