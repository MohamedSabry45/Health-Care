// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gp/core/errors/failures.dart';
import 'package:gp/features/reports/data/datasources/report_datasource.dart';
import 'package:gp/features/reports/data/models/report.dart';

class ReportDataSourceImp implements ReportDataSource {
  final FirebaseStorage firebaseStorage;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  late Reference reference;
  late CollectionReference reportCollectionReference;
  ReportDataSourceImp(
    this.firebaseStorage,
    this.firebaseAuth,
    this.firebaseFirestore,
  ) {
    // firebaseStorage.setMaxUploadRetryTime(const Duration(seconds: 5));
    reportCollectionReference =
        firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).collection('reports');
    reference = firebaseStorage.ref().child('users').child(firebaseAuth.currentUser!.uid).child('reports');
  }

  @override
  Future<Either<Failure, Unit>> uploadReport(File reportFile) async {
    try {
      //upload file to firestore first then get the url and add it to the report collection
      // firebaseFirestore.settings = const Settings(persistenceEnabled: true);
      var documentReference = await reportCollectionReference.add({'name': reportFile.path.split('/').last});
      var uploadTask = reference.child(documentReference.id).putFile(reportFile);

      var snapshot = await uploadTask.whenComplete(() => null);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      var report = {
        'url': downloadUrl,
        'name': reportFile.path.split('/').last,
        'date': DateTime.now().toIso8601String(),
      };
      await reportCollectionReference.doc(documentReference.id).set(report);
      return right(unit);
    } on FirebaseException catch (e) {
      print(e.message);
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Report>>> getAllReports() async {
    try {
      var querySnapshot = await reportCollectionReference.get();
      var list = querySnapshot.docs.map((e) => Report.fromMap(e)).toList();
      return right(list);
    } on FirebaseException catch (e) {
      print(e.message);
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteReport(String id) async {
    try {
      await reportCollectionReference.doc(id).delete();
      await reference.child(id).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      print(e.message);
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Uint8List>> getDataUnit8List(String id) async {
    var uint8list = await reference.child(id).getData();
    if (uint8list == null) {
      return left(ServerFailure());
    } else {
      return right(uint8list);
    }
  }
}
