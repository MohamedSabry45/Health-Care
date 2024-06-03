import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/reports/domain/repositories/report_repo.dart';

class GetPDFUseCase extends UseCase<Uint8List, String> {
  final ReportRepository repository;

  GetPDFUseCase({required this.repository});

  @override
  Future<Either<Failure, Uint8List>> call(String params) async {
    return await repository.getDataUnit8List(params);
  }
}