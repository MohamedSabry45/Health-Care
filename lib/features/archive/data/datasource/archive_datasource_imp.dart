import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/archive/data/datasource/archive_datasource.dart';
import 'package:gp/features/archive/domain/entity/disease.dart';
import 'package:gp/features/archive/domain/entity/diseases_parameter.dart';

class ArchiveDataSourceImp implements ArchiveDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  late CollectionReference archiveCollectionReference;

  ArchiveDataSourceImp(this.firebaseFirestore, this.firebaseAuth) {
    archiveCollectionReference =
        firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).collection('archive');
  }
  @override
  Future<Either<Failure, Unit>> addDiseaseArchive(DiseaseParameter diseaseParameter) async {
    var reference = await archiveCollectionReference.add(diseaseParameter.toMap());
    if (reference.id.isNotEmpty) {
      return right(unit);
    } else {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateDiseaseArchive(DiseaseUpdateParameter diseaseParameter) async {
    await archiveCollectionReference.doc(diseaseParameter.id).update(diseaseParameter.toMap());
    return right(unit);
  }

  @override
  Future<Either<Failure, List<Disease>>> getDiseaseArchive(String type) async {
    try {
      var querySnapshot = await archiveCollectionReference.get();
      print(querySnapshot.docs.length);
      var list =
          querySnapshot.docs.where((element) => (element.data() as Map<String, dynamic>)['type'] == type).toList();
      var diseaseList =
          list.map((e) => Disease.fromMap((e))).toList();
          print(diseaseList.length);
          print('object');
      return right(diseaseList);
    } on Exception {
      return left(ServerFailure());
    }
  }
}
