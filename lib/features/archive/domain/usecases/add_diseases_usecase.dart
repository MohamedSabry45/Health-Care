import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/archive/domain/entity/diseases_parameter.dart';
import 'package:gp/features/archive/domain/repository/archive_repository.dart';

class AddDiseaseArchiveUseCase extends UseCase<Unit,DiseaseParameter>{
  final ArchiveRepository archiveRepository;

  AddDiseaseArchiveUseCase(this.archiveRepository);

  @override
  Future<Either<Failure, Unit>> call(DiseaseParameter params) {
   return archiveRepository.addDiseaseArchive(params);
  }
  
}