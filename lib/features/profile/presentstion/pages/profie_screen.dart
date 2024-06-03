import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/features/home/presentstion/widgets/profile_image_widget.dart';
import 'package:gp/features/user/presentation/cubit/user_cubit.dart';

import '../../../../core/constansts/asset_manger.dart';
import '../../../../routes/routes_names.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userCubit = Modular.get<UserCubit>();
  @override
  void initState() {
    userCubit.getProfileData();
    super.initState();
  }

  @override
  void dispose() {
    // userCubit.user = null;
    userCubit.emit(UserInitial());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
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
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 27.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // AppLargeText(text: "Profile !"),
                SizedBox(
                  height: context.propHeight(35.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: context.propWidth(135.0),
                      height: context.propHeight(50.0),
                      color: const Color(0xff0B66A8),
                      child: OutlinedButton(
                        onPressed: () {
                          Modular.to.pushReplacementNamed(AppRoutes.profile);
                        },
                        child: const Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: context.propWidth(32)),
                    SizedBox(
                      width: context.propWidth(135.0),
                      height: context.propHeight(50.0),
                      child: OutlinedButton(
                        onPressed: () {
                          Modular.to.pushReplacementNamed(AppRoutes.editprofile,
                              arguments: userCubit.user);
                        },
                        child: const Text('Edit'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.propHeight(15.0),
                ),
                Divider(
                  height: context.propHeight(20.0),
                ),
                Row(
                  children: [
                    ProfileImageWidget(
                      height: context.propHeight(60),
                      width: context.propWidth(60),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userCubit.user?.name ?? 'User Name',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          FirebaseAuth.instance.currentUser?.email ??
                              'User Email',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: context.propHeight(20.0),
                ),

                SizedBox(
                  height: context.propHeight(15.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: context.propHeight(45.0),
                      width: context.propWidth(300.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xff75A8CD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: const Color(0xffffffff),
                          elevation: 10,
                          shadowColor: Colors.white70,
                        ),
                        onPressed: () {
                          Modular.to.pushNamed(AppRoutes.reportsPage);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My Reports',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: context.propHeight(30.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(540),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(540),
                          child: Image.asset(
                            AssetManger.gender,
                            height: context.propHeight(30),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Gender',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w200),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            userCubit.user?.gender != null
                                ? userCubit.user!.gender!
                                    ? "Male"
                                    : "Female"
                                : "Unknown",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: context.propHeight(24.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(540),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(540),
                          child: Image.asset(
                            AssetManger.phone,
                            height: context.propHeight(30),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Phone',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w200),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            userCubit.user?.phone ?? 'User Phone',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: context.propHeight(24.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(540),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(540),
                          child: Image.asset(
                            AssetManger.blood,
                            height: context.propHeight(30),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Blood Type',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w200),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            userCubit.user?.bloodType ?? 'User Blood Type',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: context.propHeight(24.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(540),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(540),
                          child: Image.asset(
                            AssetManger.age,
                            height: context.propHeight(30),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w200),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            (userCubit.user?.age ?? 'User Age').toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: context.propHeight(24.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(540),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(540),
                          child: Image.asset(
                            AssetManger.passw,
                            height: context.propHeight(30),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w200),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '***********',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: context.propHeight(24.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: context.propHeight(42.0),
                      width: context.propWidth(135.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xffffffff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: const Color(0xff0B66A8),
                          elevation: 20,
                          shadowColor: Colors.white70,
                        ),
                        onPressed: () {
                          userCubit.logout().then((_) {
                            Modular.to.navigate(AppRoutes.login);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'LOG OUT',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
