// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gp/features/diagnosis/data/model/diagnosis_model.dart';
import 'package:gp/features/diagnosis/domain/usecaase/get_diagnosis_usecase.dart';
import 'package:gp/features/diagnosis/domain/usecaase/predict_use_case.dart';

import '../../../../core/usecases/usecase.dart';

part 'diagnosis_state.dart';

class DiagnosisCubit extends Cubit<DiagnosisState> {
  List<DiagnosisModel>? diagnosis;
  List<DiagnosisModel>? searchResult;
  final GetDiagnosisUseCase getDiagnosisUseCase;
  final PredictUseCase predictUseCase;
  DiagnosisCubit(
    this.getDiagnosisUseCase, this.predictUseCase,
  ) : super(DiagnosisInitial());
  getDiagnosis() async {
    var either = await getDiagnosisUseCase(NoParams());
    either.fold(
      (l) {
        print(l);
      },
      (r) {
        diagnosis = r;
        emit(DiagnosisLoaded());
      },
    );
  }
  searchByKeyWord(String keyWord) {
    emit(DiagnosisInitial());
    if(keyWord.isEmpty){
      searchResult = null;
      emit(DiagnosisLoaded());
      return;
    }
    searchResult = diagnosis!
        .where((element) =>
            element.key.toLowerCase().contains(keyWord.toLowerCase()))
        .toList();
        
    emit(DiagnosisSearching());
  }
  Future<String> predict() async {
    var either = await predictUseCase(NoParams());
    return either.fold(
      (l) {
        return '';
      },
      (r) {
        return r;
      },
    );
  }
}
