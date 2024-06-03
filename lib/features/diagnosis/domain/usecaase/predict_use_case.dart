import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/diagnosis/domain/repository/diagnosis_repository.dart';

class PredictUseCase extends UseCase<String, NoParams> {
  final DiagnosisRepository diagnosisRepository;

  PredictUseCase(this.diagnosisRepository);
  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return diagnosisRepository.predict();
  }
  
}