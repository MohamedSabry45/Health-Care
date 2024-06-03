// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/reports/data/models/report.dart';
import 'package:gp/features/reports/domain/usecases/delete_report_use_case.dart';
import 'package:gp/features/reports/domain/usecases/get_dataPDF_usecase.dart';
import 'package:gp/features/reports/domain/usecases/get_reports_use_case.dart';
import 'package:gp/features/reports/domain/usecases/upload_use_case.dart';

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  final UploadUseCase uploadUseCase;
  final GetReportsUseCase getReportsUseCase;
  final DeleteReportUseCase deleteReportUseCase;
  final GetPDFUseCase getPDfUseCase;
  List<Report> reports = [];
  ReportsCubit(
    this.uploadUseCase,
    this.getReportsUseCase,
    this.deleteReportUseCase,
    this.getPDfUseCase,
  ) : super(ReportsInitial());
  Future<bool> uploadFile(File file) async {
    var either = await uploadUseCase(file);
    return either.fold((l) {
      // emit(ReportsError());
      return false;
    }, (r) {
      // emit(ReportsUploaded());
      return true;
    });
  }

  getReports() async {
    emit(ReportsInitial());
    var either = await getReportsUseCase(NoParams());
    return either.fold((l) {
      // emit(ReportsError());
      return false;
    }, (r) {
      // emit(ReportsUploaded());
      reports = r;
      emit(ReportsLoaded());
      return true;
    });
  }

  //delete report
  Future<bool> deleteReport(String id) async {
    emit(ReportsInitial());
    var either = await deleteReportUseCase(id);
    return either.fold((l) {
      // emit(ReportsError());
      return false;
    }, (r) {
      // emit(ReportsUploaded());
      reports.removeWhere((element) => element.id == id);
      emit(ReportsLoaded());

      return true;
    });
  }

  Future<Uint8List?> getPdf(String id) async {
    emit(ReportsInitial());
    var either =await getPDfUseCase(id);
    return either.fold((l) {
      // emit(ReportsError());
      
    }, (r) {
      // emit(ReportsUploaded());
      return r;

    });
  }
}
