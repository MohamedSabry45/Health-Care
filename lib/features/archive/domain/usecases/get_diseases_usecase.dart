import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/core/usecases/usecase.dart';
import 'package:gp/features/archive/domain/entity/disease.dart';
import 'package:gp/features/archive/domain/repository/archive_repository.dart';

class GetDiseasesUsecase extends UseCase<List<Disease>,String>{
  final ArchiveRepository archiveRepository;

  GetDiseasesUsecase(this.archiveRepository);

  @override
  Future<Either<Failure, List<Disease>>> call(String params) {
    return archiveRepository.getDiseaseArchive(params);
  }
  
}