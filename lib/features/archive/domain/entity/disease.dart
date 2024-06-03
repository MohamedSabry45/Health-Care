// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Disease {
  final String id;
  final String name;
  final String description;
  final String treatment;
  final DateTime startDate;
  final String type;

  Disease(
    this.id,
    this.name,
    this.description,
    this.treatment,
    this.startDate,
    this.type,
  );

  factory Disease. fromMap(QueryDocumentSnapshot data) {
    var map = data.data()as Map<String,dynamic>;
    // var date= map['startDate'];
    //parse date frome timestamp to DateTime
    // var date = DateTime.fromMillisecondsSinceEpoch(map['startDate'].seconds * 1000);
    return Disease(
      data.id,
      map['name'],
      map['description'],
      map['treatment'],
      DateTime.parse(map['startDate'].toString()),
      map['type'],
    );
  }


}
