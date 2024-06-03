// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/reports/data/datasources/report_datasource.dart';
import 'package:gp/features/reports/data/models/report.dart';
import 'package:gp/features/reports/domain/repositories/report_repo.dart';

class ReportRepositoryImp implements ReportRepository {
  final ReportDataSource reportDataSource;
  ReportRepositoryImp({
    required this.reportDataSource,
  });

  @override
  Future<Either<Failure, Unit>> deleteReport(String id) {
    return reportDataSource.deleteReport(id);
  }

  @override
  Future<Either<Failure, List<Report>>> getAllReports() {
    return reportDataSource.getAllReports();
  }

  @override
  Future<Either<Failure, Unit>> uploadReport(File reportFile) {
    return reportDataSource.uploadReport(reportFile);
  }

  @override
  Future<Either<Failure, Uint8List>> getDataUnit8List(String id) async{
    return await reportDataSource.getDataUnit8List(id);
  }
}
