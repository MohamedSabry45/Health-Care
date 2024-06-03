import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:gp/features/diagnosis/presentstion/cubit/diagnosis_cubit.dart';

import '../../../../routes/routes_names.dart';

class ChoicesScreen extends StatefulWidget {
  const ChoicesScreen({super.key});

  @override
  State<ChoicesScreen> createState() => _ChoicesScreenState();
}

class _ChoicesScreenState extends State<ChoicesScreen> {
  final cubit = Modular.get<DiagnosisCubit>();
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    cubit.getDiagnosis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DiagnosisCubit, DiagnosisState>(
          buildWhen: (previous, current) => true,
          builder: (context, state) {
            print(state);
            print(cubit.searchResult?.length);

            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                //Search TextField
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.propWidth(20),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      cubit.searchByKeyWord(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: state is DiagnosisSearching
                      ? ListView.builder(
                          itemCount: cubit.searchResult?.length ?? 0,
                          itemBuilder: (context, index) =>
                              cubit.searchResult == null
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : CheckboxListTile(
                                      value: cubit.diagnosis!
                                          .where((element) =>
                                              element.name ==
                                              cubit.searchResult![index].name)
                                          .first
                                          .isSelected,
                                      onChanged: (value) {
                                        cubit.diagnosis
                                            ?.where((element) =>
                                                element.name ==
                                                cubit.searchResult![index].name)
                                            .first
                                            .isSelected = value!;
                                        // cubit.diagnosis![index].isSelected = value!;
                                        setState(() {});
                                      },
                                      checkboxShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // onTap: () {
                                      //   Modular.to.pushNamed(
                                      //     '/diagnosis',
                                      //     arguments: cubit.diagnosis![index],
                                      //   );
                                      // },
                                      title: Text(cubit
                                          .searchResult![index].name
                                         ),
                                    ))
                      : ListView.builder(
                          itemCount: cubit.diagnosis?.length ?? 0,
                          itemBuilder: (context, index) =>
                              cubit.diagnosis == null
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : CheckboxListTile(
                                      value: cubit.diagnosis![index].isSelected,
                                      onChanged: (value) {
                                        cubit.diagnosis![index].isSelected =
                                            value!;
                                        setState(() {});
                                      },
                                      checkboxShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      // onTap: () {
                                      //   Modular.to.pushNamed(
                                      //     '/diagnosis',
                                      //     arguments: cubit.diagnosis![index],
                                      //   );
                                      // },
                                      title: Text(cubit.diagnosis![index].name
                                          ),
                                    ),
                        ),
                ),
                SizedBox(
                  height: context.propHeight(20),
                ),
                CustomButton(
                  width: context.propWidth(150),
                  title: 'Show Result',

                  onPressed: () async{
                       var predict = await cubit.predict();
                    //show result in dialog
                    // ignore: use_build_context_synchronously
                    

                    Modular.to.pushNamed(AppRoutes.DiagnosisPage,arguments: predict);
                  }
                ),
                SizedBox(
                  height: context.propHeight(20),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
