// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/features/archive/domain/entity/disease.dart';
import 'package:gp/features/archive/presentation/pages/archive_screen.dart';
import 'package:gp/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:gp/features/home/presentstion/widgets/profile_image_widget.dart';
import 'package:gp/features/user/presentation/cubit/user_cubit.dart';
import 'package:gp/routes/routes_names.dart';
import 'package:intl/intl.dart';

class NornalPage extends StatelessWidget {
  final Disease disease;
  
  const NornalPage({
    Key? key,
    required this.disease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(disease.name);
    print(disease.startDate);
    print(disease.description);
    return Scaffold(
      body: BodyContainer(
        header: SizedBox(
          height: context.propHeight(243),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               ProfileImageWidget(),
              const SizedBox(height: 8),
                    BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  return Text(
                    state is UserLoaded
                        ? state.user.name!
                        : '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
          
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: context.propHeight(243)),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: context.propWidth(135),
                    height: context.propHeight(50),
                    color: const Color(0xff0B66A8),
                    child: OutlinedButton(
                      onPressed: () {
                        Modular.to.pushReplacementNamed(AppRoutes.normal);
                      },
                      child: const Text(
                        " Details",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  SizedBox(
                    width: context.propWidth(135),
                    height: context.propHeight(50),
                    child: OutlinedButton(
                      onPressed: () {
                        Modular.to.pushReplacementNamed(AppRoutes.editNormal,arguments: disease);
                      },
                      child: const Text('Edit'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.propHeight(24)),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          disease.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          DateFormat('yyyy-MM-dd').format(disease.startDate),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Disease State : ${disease.description}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Drug Name :${disease.treatment}}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: context.propHeight(50),
            ),
            CustomButton(
              title: "back",
              onPressed: () {
                Modular.to.pushReplacementNamed(AppRoutes.diseasesPage);
              },
              height: context.propHeight(42),
              width: context.propHeight(135),
              backgroundColor: HexColor("0B66A8"),
            )
          ],
        ),
      ),
    );
  }
}
