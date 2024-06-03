part of 'diagnosis_cubit.dart';

abstract class DiagnosisState extends Equatable {
  const DiagnosisState();

  @override
  List<Object> get props => [];
}

class DiagnosisInitial extends DiagnosisState {}
class DiagnosisLoaded extends DiagnosisState {}
class DiagnosisSearching extends DiagnosisState {}
