

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final int? age;
  final DocumentReference? reference;
  UserModel({
    this.id,
    required this.name,
    this.age,
    this.reference,
  });


  UserModel copyWith({
    String? id,
    String? name,
    int? age,
    DocumentReference? reference,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      reference: reference ?? this.reference,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'reference': reference,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ??'',
      name: map['name'] ??'',
      age: map['age']??0,
      reference: map['reference'],
    );
  }

}
