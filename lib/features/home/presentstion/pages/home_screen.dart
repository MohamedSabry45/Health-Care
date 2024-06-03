import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/asset_manger.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/features/home/presentstion/widgets/profile_image_widget.dart';
import 'package:gp/features/user/presentation/cubit/user_cubit.dart';

import '../../../../routes/routes_names.dart';

class HomeScreen extends StatelessWidget {
  final UserCubit userCubit = Modular.get<UserCubit>();
  HomeScreen({
    Key? key,
    this.controller,
  }) : super(key: key);
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    if(userCubit.user == null) {
      userCubit.getProfileData();
    }
    return Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: HexColor("75A8CD"),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 26, right: 19.5),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                        AssetManger.notice,
                        fit: BoxFit.cover,
                        height: context.propHeight(24),
                        width: context.propHeight(25),
                        color: HexColor("FFFFFF"),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17, left: 27, bottom: 74, right: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Start\nyour health day\n comfortably",
                        style: context.textTheme.displayMedium?.copyWith(
                          color: HexColor("FFFFFF"),
                          fontSize: context.propWidth(24),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                     ProfileImageWidget()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 51),
                child: Container(
                  height: context.propHeight(47),
                  width: context.propWidth(320),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Material(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        prefix: const SizedBox(
                          width: 5,
                        ),
                        border: InputBorder.none,
                        hintText: 'Search Here ',
                        // helperStyle: const TextStyle(color: Colors.black),
                        hintStyle: TextStyle(
                          color: HexColor("4F79E4"),
                          fontSize: context.propWidth(12),
                          fontWeight: FontWeight.w500,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: context.propHeight(322),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: HexColor("FFFFFF"),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                    children: [
                      Text("How to get Started ?",
                          style: context.textTheme.displayMedium?.copyWith(
                            color: HexColor("000000"),
                            fontSize: context.propWidth(16),
                            fontWeight: FontWeight.w300,
                          )),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TabWidget(
                                  text: "Enter your\nprofile",
                                  imge: AssetManger.profile,
                                  onPressed: () {
                                    Modular.to.pushNamed(AppRoutes.profile);
                                  },
                                ),
                                TabWidget(
                                    text: "Your Archive",
                                    imge: AssetManger.archive,
                                    onPressed: () {
                                      Modular.to.pushNamed(AppRoutes.archive);
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: context.propHeight(20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TabWidget(
                                    text: "View your\ncalendar",
                                    imge: AssetManger.calendar,
                                    onPressed: () {
                                      Modular.to.pushNamed(AppRoutes.profile);
                                    }),
                                TabWidget(
                                    text: "Discover\nyour disease",
                                    imge: AssetManger.ml,
                                    onPressed: () {
                                      Modular.to.pushNamed(AppRoutes.diagnosisStart);
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.text,
    required this.imge,
    required this.onPressed,
  });
  final String text;
  final imge;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.propHeight(150),
      width: context.propHeight(110),
      child: Container(
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
        child: Material(
          child: InkWell(
              onTap: onPressed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    imge,
                    height: context.propHeight(110),
                    width: context.propWidth(110),
                  ),
                  Text(
                    text,
                    style: context.textTheme.displayMedium?.copyWith(
                      color: HexColor("4F79E4"),
                      fontSize: context.propWidth(14),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
