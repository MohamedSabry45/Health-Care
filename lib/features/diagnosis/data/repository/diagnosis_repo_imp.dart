import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/diagnosis/data/datasource/diag_datasource.dart';
import 'package:gp/features/diagnosis/data/model/diagnosis_model.dart';
import 'package:gp/features/diagnosis/domain/repository/diagnosis_repository.dart';

class DiagnosisRepositoryImp implements DiagnosisRepository{
  final DiagnosisDataSource diagnosisDataSource;

  DiagnosisRepositoryImp(this.diagnosisDataSource);
  @override
  Future<Either<Failure, List<DiagnosisModel>>> getDiagnosis() {
   return diagnosisDataSource.getDiagnosis();
  }
  
  @override
  Future<Either<Failure, String>> predict() {
   return diagnosisDataSource.predict();
  }

}