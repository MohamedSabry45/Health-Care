import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/reports/domain/repositories/report_repo.dart';

class DeleteReportUseCase extends UseCase<Unit,String>{
  final ReportRepository reportRepository;
  DeleteReportUseCase({
    required this.reportRepository,
  });

  @override
  Future<Either<Failure, Unit>> call(String params) {
    return reportRepository.deleteReport(params);
  }
  
}