// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';

import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/reports/domain/repositories/report_repo.dart';

class UploadUseCase extends UseCase<Unit,File> {
  final ReportRepository reportRepository;
  UploadUseCase({
    required this.reportRepository,
  });

  @override
  Future<Either<Failure, Unit>> call(File params) {
    return reportRepository.uploadReport(params);
  }

}
