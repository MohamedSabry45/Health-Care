// ignore_for_file: public_member_api_docs, sort_constructors_first
class DiseaseParameter {
  final String name;
  final String description;
  final String treatment;
  final DateTime startDate;
  final String type;
  DiseaseParameter({
    required this.type,
    required this.name,
    required this.description,
    required this.treatment,
    required this.startDate,
  });

  Map<String,dynamic>? toMap() {
    return {
      'name': name,
      'description': description,
      'treatment': treatment,
      'startDate': startDate.toIso8601String(),
      'type': type,
    };
  }
  
}

class DiseaseUpdateParameter {
  final String id;
  final String? name;
  final String? description;
  final String? treatment;
  final String type;
  final DateTime? startDate;
  DiseaseUpdateParameter({
    required this.id,
    required this.type,
    this.name,
    this.description,
    this.treatment,
    this.startDate,
  });
  toMap() {
    var map = <String, dynamic>{
      'id': id,
      'type': type,
    };
    if (name != null) {
      map['name'] = name;
    }
    if (description != null) {
      map['description'] = description;
    }
    if (treatment != null) {
      map['treatment'] = treatment;
    }
    if (startDate != null) {
      map['startDate'] = startDate?.toIso8601String();
    }
    return map;
   
  }
 factory DiseaseUpdateParameter.fromMap(Map<String, dynamic> map) {
    return DiseaseUpdateParameter(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      treatment: map['treatment'],
      startDate: map['startDate'],
      type: map['type'],
    );
  }
}
