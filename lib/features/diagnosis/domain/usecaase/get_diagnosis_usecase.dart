import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/diagnosis/data/model/diagnosis_model.dart';
import 'package:gp/features/diagnosis/domain/repository/diagnosis_repository.dart';

class GetDiagnosisUseCase extends UseCase<List<DiagnosisModel>,NoParams>{
  final DiagnosisRepository diagnosisRepository;

  GetDiagnosisUseCase(this.diagnosisRepository);
  
  @override
  Future<Either<Failure, List<DiagnosisModel>>> call(NoParams params) {
    return diagnosisRepository.getDiagnosis();
  }
  

}