import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/diagnosis/data/model/diagnosis_model.dart';

abstract class DiagnosisDataSource {
  Future<Either<Failure, List<DiagnosisModel>>> getDiagnosis();

  Future<Either<Failure, String>> predict() ;

}
