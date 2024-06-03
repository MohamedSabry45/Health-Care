import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/features/home/presentstion/widgets/profile_image_widget.dart';

import '../../../../core/constansts/asset_manger.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../routes/routes_names.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BodyContainer(
            header: SizedBox(
              height: context.propHeight(243),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_none,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              "Let’s\n help you",
                              style: context.textTheme.bodyLarge?.copyWith(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ProfileImageWidget(
                            height: context.propHeight(60),
                            width: context.propWidth(60),
                          ),
                        ),
                      ]),
                  SizedBox(height: context.propHeight(48)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: context.propHeight(243)),
                      SizedBox(
                        child: Text(
                          "Add  reports  &  learn  about  your  disease",
                          style: context.textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: context.propHeight(243)),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    child: Text(
                      "How can we help you ?",
                      style: context.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 36),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: context.propHeight(30),
                          ),
                          Container(
                            width: context.propWidth(231),
                            height: context.propHeight(40),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text('Chronic diseases'),
                                InkWell(
                                  child: const Icon(Icons.arrow_forward),
                                  onTap: () {
                                    Modular.to.pushNamed(AppRoutes.diseasesPage,
                                        arguments: "chronic");
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.propHeight(29),
                          ),
                          Container(
                            width: context.propWidth(231),
                            height: context.propHeight(40),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Genatic Diseases'),
                                InkWell(
                                  child: const Icon(Icons.arrow_forward),
                                  onTap: () {
                                    Modular.to.pushNamed(AppRoutes.diseasesPage,
                                        arguments: "genatic");
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.propHeight(29),
                          ),
                          Container(
                            width: context.propWidth(231),
                            height: context.propHeight(40),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(0, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Diseases'),
                                InkWell(
                                  child: const Icon(Icons.arrow_forward),
                                  onTap: () {
                                    Modular.to.pushNamed(AppRoutes.diseasesPage,
                                        arguments: "diseases");
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.propHeight(40),
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.propHeight(41),
                  ),
                  const Text(
                    "Your Reports",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(
                    height: context.propHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Modular.to.pushNamed(AppRoutes.upload);
                        },
                        child: Container(
                          width: context.propHeight(70),
                          height: context.propHeight(75),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            AssetManger.upload,
                            width: context.propWidth(32),
                            height: context.propHeight(32),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.propWidth(50),
                      ),
                      InkWell(
                        onTap: () {
                          Modular.to.pushNamed(AppRoutes.reportsPage);
                        },
                        child: Container(
                          width: context.propHeight(70),
                          height: context.propHeight(75),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                ' All  Reports ',
                                style:
                                    context.textTheme.displayMedium?.copyWith(
                                  color: HexColor("75A8CD"),
                                  fontSize: context.propWidth(12),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    Key? key,
    required this.header,
    required this.body,
  }) : super(key: key);
  final header;
  final body;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: HexColor("FFFFFF"),
            ),
            child: body,
          ),
          Container(
            // width: double.infinity,
            height: context.propHeight(243),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: HexColor("75A8CD"),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: header,
          ),
        ],
      ),
    );
  }
}
