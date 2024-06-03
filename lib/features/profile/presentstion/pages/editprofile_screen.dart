// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/features/user/domain/entities/profile_user_parameter.dart';
import 'package:gp/features/user/presentation/cubit/user_cubit.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constansts/asset_manger.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../routes/routes_names.dart';
import '../../../auth/presentation/pages/login_screen.dart';
import '../../../auth/presentation/pages/onboarding_screen.dart';

class EditProfileScreen extends StatefulWidget {
  final ProfileUserParameter profileUserParameter;
  const EditProfileScreen({
    Key? key,
    required this.profileUserParameter,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    nameController.text = widget.profileUserParameter.name ?? '';
    emailController.text = FirebaseAuth.instance.currentUser?.email ?? '';
    bloodController.text = widget.profileUserParameter.bloodType ?? '';
    passwController.text = widget.profileUserParameter.password ?? '';
    phonController.text = widget.profileUserParameter.phone ?? '';
    ageController.text = widget.profileUserParameter.age.toString();

    super.initState();
  }

  bool? gender;
  final formKey = GlobalKey<FormState>();
  File? image;
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController bloodController = TextEditingController();

  final TextEditingController passwController = TextEditingController();

  final TextEditingController phonController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
            },
            icon: const Icon(Icons.settings),
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AppLargeText(text: "Edit Profile !"),
              SizedBox(
                height: context.propHeight(30.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.propWidth(135.0),
                    height: 45,
                    child: OutlinedButton(
                      onPressed: () {
                        Modular.to.pushReplacementNamed(AppRoutes.profile);
                      },
                      child: const Text('Profile'),
                    ),
                  ),
                  const SizedBox(width: 32),
                  Container(
                    width: context.propWidth(135.0),
                    height: 45,
                    color: const Color(0xff0B66A8),
                    child: OutlinedButton(
                      onPressed: () {
                        Modular.to.pushReplacementNamed(AppRoutes.editprofile);
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.propHeight(15.0),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: image != null
                              ? Image.file(
                                  image!,
                                  height: context.propHeight(50),
                                  width: context.propWidth(50),
                                  fit: BoxFit.fill,
                                )
                              : widget.profileUserParameter.photoUrl != null
                                  ? Image.network(
                                      widget.profileUserParameter.photoUrl!,
                                      height: context.propHeight(50),
                                      width: context.propWidth(50),
                                    )
                                  : Image.asset(
                                      AssetManger.user,
                                      height: context.propHeight(40),
                                    )),
                      Positioned(
                        left: 0,
                        bottom: -15, // Set the bottom margin to 16 pixels
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            //show dialog to choose from camera or gallery
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Choose option'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('Select option to choose image'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Gallery'),
                                      onPressed: () {
                                        //open gallery
                                        ImagePicker.platform
                                            .pickImage(
                                                source: ImageSource.gallery)
                                            .then((value) {
                                          setState(() {
                                            image = File(value!.path);
                                          });
                                        });
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Camera'),
                                      onPressed: () {
                                        //open camera
                                        ImagePicker.platform
                                            .pickImage(
                                                source: ImageSource.camera)
                                            .then((value) {
                                          setState(() {
                                            // _image = value;

                                            image = File(value!.path);
                                          });
                                        });
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Gender'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.propWidth(90.0),
                    height: context.propHeight(30.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            gender == false ? AppColors.primaryColor : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        if (gender == false) {
                          setState(() {
                            gender = null;
                          });
                        } else {
                          setState(() {
                            gender = false;
                          });
                        }
                      },
                      child: Text(
                        'Female',
                        style: TextStyle(
                            color: gender == false ? Colors.white : null),
                      ),
                    ),
                  ),
                  SizedBox(width: context.propWidth(20.0)),
                  SizedBox(
                    width: context.propWidth(90.0),
                    height: context.propHeight(30.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            gender == true ? AppColors.primaryColor : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        if (gender == true) {
                          setState(() {
                            gender = null;
                          });
                        } else {
                          setState(() {
                            gender = true;
                          });
                        }
                      },
                      child: Text(
                        'Male',
                        style: TextStyle(
                            color: gender == true ? Colors.white : null),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Basic Detail'),
                ],
              ),
              SizedBox(
                height: context.propHeight(10),
              ),

              SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        hintText: "Full Name",
                        labelText: "Your Name ",
                        suffixIcon: const Icon(
                          Icons.edit,
                          color: Color(0xff75A8CD),
                          size: 18,
                        ),
                        height: context.propHeight(40),
                        width: context.propWidth(290),
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        errorText: "Please enter your name ",
                        validator: (value, errorText) {
                          if (value!.isEmpty) {
                            return errorText;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: context.propHeight(7),
                      ),
                      CustomTextField(
                        disabled: false,
                        hintText: "Email",
                        labelText: "Your Email ",
                        suffixIcon: const Icon(
                          Icons.edit,
                          color: Color(0xff75A8CD),
                          size: 18,
                        ),
                        height: context.propHeight(40),
                        width: context.propWidth(290),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        errorText: "Please enter a valid email ",
                        validator: (value, errorText) {
                          if (value!.contains('@') && value.contains('.')) {
                            return errorText;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: context.propHeight(7),
                      ),
                      CustomTextField(
                          hintText: "age",
                          labelText: "Your age ",
                          suffixIcon: const Icon(
                            Icons.edit,
                            color: Color(0xff75A8CD),
                            size: 18,
                          ),
                          height: context.propHeight(40),
                          width: context.propWidth(290),
                          controller: ageController,
                          keyboardType: TextInputType.emailAddress,
                          errorText: "Please enter a your age",
                          validator: (value, errorText) {
                            if (value == null || value.isEmpty) {
                              return errorText;
                            }

                            int? age = int.tryParse(value);

                            if (age == null || age < 0 || age > 120) {
                              return 'Please enter a valid age.';
                            }

                            return null;
                          }),
                      SizedBox(
                        height: context.propHeight(7),
                      ),
                      CustomTextField(
                        hintText: "Blood Type",
                        labelText: "Your Blood Type ",
                        suffixIcon: const Icon(
                          Icons.edit,
                          color: Color(0xff75A8CD),
                          size: 18,
                        ),
                        height: context.propHeight(40),
                        width: context.propWidth(290),
                        controller: bloodController,
                        keyboardType: TextInputType.name,
                        errorText: "Please enter your Blood Type ",
                        validator: (value, errorText) {
                          if (value!.isEmpty) {
                            return errorText;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: context.propHeight(7),
                      ),
                      CustomTextField(
                        hintText: "password",
                        labelText: "Your password ",
                        suffixIcon: const Icon(
                          Icons.edit,
                          color: Color(0xff75A8CD),
                          size: 18,
                        ),
                        height: context.propHeight(40),
                        width: context.propWidth(290),
                        controller: passwController,
                        keyboardType: TextInputType.name,
                        errorText: "Please enter a valid password",
                        validator: (value, errorText) {
                          if (value!.isEmpty) {
                            return errorText;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: context.propHeight(37),
                      ),
                      Text(
                        "Contact Detail",
                        style: context.textTheme.displayMedium?.copyWith(
                          // color: HexColor("4F79E4"),
                          fontSize: context.propWidth(16),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: context.propHeight(11),
                      ),
                      CustomTextField(
                        hintText: "phone",
                        labelText: "Your phone ",
                        suffixIcon: const Icon(
                          Icons.edit,
                          color: Color(0xff75A8CD),
                          size: 18,
                        ),
                        height: context.propHeight(40),
                        width: context.propWidth(290),
                        controller: phonController,
                        keyboardType: TextInputType.phone,
                        errorText: "Please enter a valid phone",
                        validator: (value, errorText) {
                          if (value!.isEmpty) {
                            return errorText;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: context.propHeight(25),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 94),
                        child: CustomButton(
                          title: "Done",
                          onPressed: () async {
                            var userCubit = Modular.get<UserCubit>();
                            var parameter = ProfileUserParameter(
                                bloodType: bloodController.text.isEmpty
                                    ? null
                                    : bloodController.text,
                                email: emailController.text.isEmpty
                                    ? null
                                    : emailController.text,
                                name: nameController.text.isEmpty
                                    ? null
                                    : nameController.text,
                                password: passwController.text.isEmpty
                                    ? null
                                    : passwController.text,
                                phone: phonController.text.isEmpty
                                    ? null
                                    : phonController.text,
                                age: ageController.text.isEmpty
                                    ? null
                                    : int.parse(ageController.text),
                                gender: gender);
                            if (image != null) {
                              // parameter.image = image;
                              await userCubit.uploadImage(image!);
                            }
                            var result =
                                await userCubit.updateProfile(parameter);
                            if (result) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Profile Updated Successfully'),
                                ),
                              );
                              Modular.to.pop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Profile Updated Failed'),
                                ),
                              );
                            }
                          },
                          height: context.propHeight(42),
                          width: context.propHeight(135),
                          backgroundColor: HexColor("0B66A8"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
