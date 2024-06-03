// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';

import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/archive/domain/entity/diseases_parameter.dart';
import 'package:gp/features/archive/domain/repository/archive_repository.dart';

class UpdateDiseaseUsecase extends UseCase<Unit,DiseaseUpdateParameter> {
final ArchiveRepository archiveRepository;
  UpdateDiseaseUsecase({
    required this.archiveRepository,
  });

  @override
  Future<Either<Failure, Unit>> call(DiseaseUpdateParameter params) {
    return archiveRepository.updateDiseaseArchive(params);
  }
  
}
