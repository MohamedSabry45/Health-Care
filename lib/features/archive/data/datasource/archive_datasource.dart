import 'package:dartz/dartz.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/archive/domain/entity/disease.dart';
import 'package:gp/features/archive/domain/entity/diseases_parameter.dart';

abstract class ArchiveDataSource{
  Future<Either<Failure, Unit>> addDiseaseArchive(DiseaseParameter diseaseParameter) ;
  Future<Either<Failure, Unit>> updateDiseaseArchive(DiseaseUpdateParameter diseaseParameter) ;

 Future<Either<Failure, List<Disease>>>  getDiseaseArchive(String type) ;
  
}