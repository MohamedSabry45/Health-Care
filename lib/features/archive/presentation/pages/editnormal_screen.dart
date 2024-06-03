// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/features/archive/domain/entity/disease.dart';
import 'package:gp/features/archive/presentation/cubit/archive_cubit.dart';
import 'package:gp/features/archive/presentation/pages/archive_screen.dart';
import 'package:gp/features/auth/presentation/pages/login_screen.dart';
import 'package:gp/features/home/presentstion/pages/home_screen.dart';
import 'package:gp/features/home/presentstion/widgets/profile_image_widget.dart';
import 'package:gp/features/user/presentation/cubit/user_cubit.dart';
import 'package:intl/intl.dart';

import '../../domain/entity/diseases_parameter.dart';

class EditNormalScreen extends StatefulWidget {
  final Disease disease;
  const EditNormalScreen({
    Key? key,
    required this.disease,
  }) : super(key: key);

  @override
  State<EditNormalScreen> createState() => _EditNormalScreenState();
}

class _EditNormalScreenState extends State<EditNormalScreen> {
   final TextEditingController nameController = TextEditingController();

  // final TextEditingController startDateController = TextEditingController();
  // final DatePickerController startDateController = DatePickerController();
  DateTime? startDate;

  final TextEditingController stateController = TextEditingController();

  final TextEditingController dragController = TextEditingController();
  @override
  void initState() {
    startDate = widget.disease.startDate;
    nameController.text = widget.disease.name;
    stateController.text = widget.disease.description;
    dragController.text = widget.disease.treatment;
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyContainer(
        header: SizedBox(
          height: context.propHeight(243),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             ProfileImageWidget(
                            height: context.propHeight(60),
                            width: context.propWidth(60),
                          ),
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: context.propHeight(243),
              ),
              SizedBox(height: context.propHeight(24)),
              CustomTextField(
                hintText: "Disease Name",
                labelText: "Disease Name",
                suffixIcon: const Icon(
                  Icons.edit,
                  color: Color(0xff75A8CD),
                  size: 18,
                ),
                height: context.propHeight(40),
                width: context.propWidth(290),
                controller: nameController,
                keyboardType: TextInputType.name,
                errorText: "Please enter a valid name",
                validator: (value, errorText) {
                  if (value!.isEmpty) {
                    return errorText;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
             InkWell(

                onTap: () async{
                 var time = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
                setState(() {
                  startDate = time;
                });
                },
                child: CustomTextField(
                  disabled:false,
                  hintText: "Start Date",
                  labelText: "Start Date ",
                  suffixIcon: const Icon(
                    Icons.edit,
                    color: Color(0xff75A8CD),
                    size: 18,
                  ),
                  height: context.propHeight(40),
                  width: context.propWidth(290),
                  controller: TextEditingController(text:startDate==null?'': DateFormat.yMEd().format(startDate!)),
                  keyboardType: TextInputType.datetime,
                  errorText: "Please enter a valid date",
                  validator: (value, errorText) {
                    if (value!.isEmpty) {
                      return errorText;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: "Disease State",
                labelText: "Disease State ",
                suffixIcon: const Icon(
                  Icons.edit,
                  color: Color(0xff75A8CD),
                  size: 18,
                ),
                height: context.propHeight(40),
                width: context.propWidth(290),
                controller: stateController,
                errorText: "Please enter a valid state",
                validator: (value, errorText) {
                  if (value!.isEmpty) {
                    return errorText;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: "Drage Name",
                labelText: "Drage Name ",
                suffixIcon: const Icon(
                  Icons.edit,
                  color: Color(0xff75A8CD),
                  size: 18,
                ),
                height: context.propHeight(40),
                width: context.propWidth(290),
                controller: dragController,
                errorText: "please enter vailed name",
                validator: (value, errorText) {
                  if (value!.isEmpty) {
                    return errorText;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 100),
              SizedBox(
                width: context.propWidth(30),
                child: OutlinedButton(
                  onPressed: () async {
                    var archiveCubit = Modular.get<ArchiveCubit>();
                    var addDisease = await archiveCubit.updateDisease(DiseaseUpdateParameter(
                      id: widget.disease.id,
                      type: widget.disease.type,
                      name: nameController.text,
                      startDate: startDate??DateTime.now(),
                      description: stateController.text,
                      treatment: dragController.text,
                    ));
                    if (addDisease) {
                     Modular.to.pop();
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(
                      vertical: context.propHeight(16),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
