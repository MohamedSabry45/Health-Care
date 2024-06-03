import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/reports/data/models/report.dart';

abstract class ReportDataSource{
  Future<Either<Failure, Unit>> uploadReport(File reportFile) ;

  Future<Either<Failure, List<Report>>> getAllReports();

  Future<Either<Failure, Unit>> deleteReport(String id) ;

 Future<Either<Failure, Uint8List>>  getDataUnit8List(String id) ;
}