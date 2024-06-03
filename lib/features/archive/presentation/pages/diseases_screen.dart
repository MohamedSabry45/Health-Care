// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/features/archive/presentation/cubit/archive_cubit.dart';
import 'package:gp/features/archive/presentation/pages/archive_screen.dart';

import '../../../../routes/routes_names.dart';

class DiseasesScreen extends StatefulWidget {
  final String type;
  const DiseasesScreen({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<DiseasesScreen> createState() => _DiseasesScreenState();
}

class _DiseasesScreenState extends State<DiseasesScreen> {
  final cubit = Modular.get<ArchiveCubit>();
  @override
  void initState() {
    cubit.getDisease(widget.type);
    
    super.initState();
  }
  @override
  void dispose() {
    cubit.emit(ArchiveInitial());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed(AppRoutes.addNormal, arguments: widget.type);
        },
        child: const Icon(Icons.add),
      ),
      body: BodyContainer(
        header: SizedBox(
          height: context.propHeight(243),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: context.propHeight(85),
              ),
              const Text(
                'Your Diseases Information',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<ArchiveCubit, ArchiveState>(
          builder: (context, state) {
            return SizedBox(
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: context.propHeight(243)),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 74, 167, 243),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'Diseases',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
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
                      child: (state is ArchiveDiseasesLoaded) == false
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: cubit.normalDiseases.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Modular.to.pushNamed(AppRoutes.normal,arguments: cubit.normalDiseases[index]);
                                  },
                                  child: ListTile(
                                    title: Text(cubit.normalDiseases[index].name),
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
