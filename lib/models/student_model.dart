import 'package:flutter/material.dart';

class StudentModel {
  int id;
  String name;
  String course;
  String mobile;
  String totalFee;
  String feePaid;

  StudentModel({
    this.id,
    @required this.name,
    @required this.course,
    @required this.mobile,
    @required this.totalFee,
    @required this.feePaid,
  });
  //name constructor if made multi constructor so they name constructor
//   StudentModel.anotherConstructor({
//
// });

  //when add students to sql we send map not dart obj
  //so we convert dart obj to map
  Map<String, dynamic> toMap() {
    //return map
    return {
      'id': this.id,
      'name': this.name,
      'course': this.course,
      'mobile': this.mobile,
      'totalFee': this.totalFee,
      'feePaid': this.feePaid,
    };
  }
  //extract a student obj into map obj
  static StudentModel fromMap(Map<String, dynamic> map) {
    return StudentModel(
        id: map['id'],
        name: map['name'],
        course: map['course'],
        mobile: map['mobile'],
        totalFee: map['totalFee'].toString(),
        feePaid: map['feePaid'].toString(),
        );
  }
}
