// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gp/core/constansts/string_extensions.dart';

class DiagnosisModel extends Equatable {
  final String key;
  bool isSelected = false;
   DiagnosisModel(this.key);
 String  get name{
    //replace all _ with space by looping through the string
   var name= key;
    name=name.characters.map((e) => e=='_'||e=='_'?' ':e).join();
    print(name);
    return name.capitalizeLikeCamelCase();
   }

  @override
  List<Object> get props => [key];
}
