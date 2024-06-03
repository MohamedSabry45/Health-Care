import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Report {
  final String id;
  final String name;
  final String url;
  final DateTime dateTime;
  Report({
    required this.id,
    required this.name,
    required this.url,
    required this.dateTime,
  });

  Report copyWith({
    String? id,
    String? name,
    String? url,
    DateTime? dateTime,
  }) {
    return Report(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'url': url,
      'date': dateTime.toIso8601String(),
    };
  }

  factory Report.fromMap(QueryDocumentSnapshot data) {
    var map = data.data() as Map<String, dynamic>;
    return Report(
      id: data.id,
      name: map['name'] as String,
      url: map['url'] as String,
      dateTime: DateTime.parse(map['date'] ),
    );
  }

  String toJson() => json.encode(toMap());


  @override
  String toString() {
    return 'Report(id: $id, name: $name, url: $url, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant Report other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.url == url &&
      other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      url.hashCode ^
      dateTime.hashCode;
  }
}
