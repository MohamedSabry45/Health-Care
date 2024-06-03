import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gp/features/archive/domain/entity/disease.dart';
import 'package:gp/features/archive/domain/entity/diseases_parameter.dart';
import 'package:gp/features/archive/domain/usecases/add_diseases_usecase.dart';
import 'package:gp/features/archive/domain/usecases/get_diseases_usecase.dart';
import 'package:gp/features/archive/domain/usecases/update_disease_usecase.dart';

part 'archive_state.dart';

class ArchiveCubit extends Cubit<ArchiveState> {
  final AddDiseaseArchiveUseCase addDiseaseArchiveUseCase;
  final GetDiseasesUsecase getDiseasesUsecase;
  final UpdateDiseaseUsecase updateDiseaseUsecase;

   List<Disease> normalDiseases = [];

  ArchiveCubit(this.addDiseaseArchiveUseCase, this.getDiseasesUsecase, this.updateDiseaseUsecase) : super(ArchiveInitial());
  Future<bool> addDisease(DiseaseParameter diseaseParameter) async {
    emit(ArchiveInitial() );
    final result = await addDiseaseArchiveUseCase(diseaseParameter);
    return result.fold((l) => false, (r) async{
     await getDisease( diseaseParameter.type);
      return true;
    });
  }

  getDisease(String type) async {
    var either = await getDiseasesUsecase(type);
    either.fold((l) {
      return null;
    }, (r) {
      print(r.length);
     normalDiseases=r;
     emit(ArchiveDiseasesLoaded());
    });

  }
 Future<bool> updateDisease(DiseaseUpdateParameter parameter)async{
   var either = await updateDiseaseUsecase(parameter);
   emit(ArchiveInitial());
  return either.fold((l) {
     return false;
   }, (r) async {
   await getDisease(parameter.type);
    //  emit(ArchiveDiseasesLoaded());
    return true;
   });
  }
}
