// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/reports/data/models/report.dart';
import 'package:gp/features/reports/domain/repositories/report_repo.dart';

class GetReportsUseCase extends UseCase<List<Report>,NoParams> {
  final ReportRepository reportRepository;
  GetReportsUseCase({
    required this.reportRepository,
  });

  @override
  Future<Either<Failure, List<Report>>> call(NoParams params) {
    return reportRepository.getAllReports();
  }
}
