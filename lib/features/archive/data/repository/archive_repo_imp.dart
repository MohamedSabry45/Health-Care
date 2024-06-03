import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/archive/data/datasource/archive_datasource.dart';
import 'package:gp/features/archive/domain/entity/disease.dart';
import 'package:gp/features/archive/domain/entity/diseases_parameter.dart';
import 'package:gp/features/archive/domain/repository/archive_repository.dart';

class ArchiveRepositoryImp implements ArchiveRepository{
  final ArchiveDataSource archiveDataSource;

  ArchiveRepositoryImp(this.archiveDataSource);
  @override
  Future<Either<Failure, Unit>> addDiseaseArchive(DiseaseParameter diseaseParameter) async{
    return await archiveDataSource.addDiseaseArchive(diseaseParameter);
  }

  @override
  Future<Either<Failure, List<Disease>>> getDiseaseArchive(String type) async{
   return await archiveDataSource.getDiseaseArchive(type);
  }

  @override
  Future<Either<Failure, Unit>> updateDiseaseArchive(DiseaseUpdateParameter diseaseParameter) {
    return archiveDataSource.updateDiseaseArchive(diseaseParameter);
  }

}