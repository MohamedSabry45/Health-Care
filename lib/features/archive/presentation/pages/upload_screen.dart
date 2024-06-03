import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:gp/features/reports/presentation/cubit/reports_cubit.dart';

import '../../../../core/theme/app_colors.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? file;
  String? filepath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: HexColor("75A8CD"),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.propHeight(246),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_file,
                      color: Colors.white,
                      size: 80,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Upload PDF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton(
                        title: "Select PDF",
                        onPressed: () async {
                          var result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );
                          if (result != null) {
                            setState(() {
                              file = File(result.files.single.path!);
                              filepath =
                                  result.files.single.path?.split('/').last;
                            });
                          } else {
                            // User canceled the picker
                          }
                        }),
                    const SizedBox(height: 16),
                    Text(
                      file != null
                          ? 'Selected file: $filepath'
                          : 'Selected file: No file selected',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    CustomButton(
                        title: "Upload",
                        onPressed: () async {
                          var reportsCubit = Modular.get<ReportsCubit>();
                          var result = await reportsCubit.uploadFile(file!);
                          if (result) {
                            Modular.to.pop();
                          }
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
