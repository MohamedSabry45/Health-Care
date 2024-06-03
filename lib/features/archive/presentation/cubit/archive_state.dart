part of 'archive_cubit.dart';

abstract class ArchiveState extends Equatable {
  const ArchiveState();

  @override
  List<Object> get props => [];
}

class ArchiveInitial extends ArchiveState {}
class ArchiveDiseasesLoaded extends ArchiveState {}
