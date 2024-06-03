import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/features/reports/presentation/cubit/reports_cubit.dart';

import 'archive_screen.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final cubit = Modular.get<ReportsCubit>();
  @override
  void initState() {
    cubit.getReports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyContainer(
        header: SizedBox(
          height: context.propHeight(243),
          width: double.infinity,
          child: const Center(
            child: Text(
              'Your X-rays,reports and imaginations ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: context.propHeight(243),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
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
                'X-rays,reports and imaginations ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlocBuilder<ReportsCubit, ReportsState>(
              builder: (context, state) {
                return Expanded(
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
                    child: ListView.builder(
                      itemCount: cubit.reports.length,
                      itemBuilder: (context, index) {
                        final pdfData = cubit.reports[index];
                        return ListTile(
                          leading: IconButton(
                            icon: const Icon(Icons.picture_as_pdf),
                            onPressed: () async {
                              print(pdfData.url);
                              //show pdf
                             var uint8list = await cubit.getPdf(pdfData.id);
                             if(uint8list != null) {
                               // ignore: use_build_context_synchronously
                               Modular.to.push(MaterialPageRoute(builder: (context) =>  Scaffold(
                                body: PDFView(
                                    //  filePath: pdfData.url,/
                                     pdfData: uint8list,
                                     autoSpacing: true,
                                     
                                   ),
                               )));
                              
                             }}
                          ),
                          title: Text(pdfData.name),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline_outlined),
                            onPressed: () {
                              cubit.deleteReport(pdfData.id);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
