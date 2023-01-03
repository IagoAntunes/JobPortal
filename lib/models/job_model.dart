// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class JobModel {
  String title;
  String subtitle;
  String timeJob;
  String salary;
  String location;
  String experience;
  String description;

  String image;
  String completeDescription;
  String role;
  List<String> skills;

  DateTime date;
  Color color;
  Color secondaryColor;
  Color textColor;

  JobModel({
    required this.date,
    required this.description,
    required this.experience,
    required this.location,
    required this.salary,
    required this.subtitle,
    required this.timeJob,
    required this.title,
    required this.color,
    required this.secondaryColor,
    required this.textColor,
    required this.completeDescription,
    required this.role,
    required this.skills,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'timeJob': timeJob,
      'salary': salary,
      'location': location,
      'experience': experience,
      'description': description,
      'date': date,
      'completeDescription': completeDescription,
      'role': role,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(Map<String, dynamic> map) {
    final job = JobModel(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      timeJob: map['timeJob'] as String,
      salary: map['salary'] as String,
      location: map['location'] as String,
      experience: map['experience'] as String,
      description: map['description'] as String,
      completeDescription: map['completeDescription'] as String,
      role: map['role'] as String,
      image: map['image'] as String,
      skills: List.from(map['skills']),
      date: DateTime.parse(map['date']),
      color: Color(int.parse('0xff${map['color']}')),
      secondaryColor: Color(int.parse('0xff${map['secondaryColor']}')),
      textColor: Color(int.parse('0xff${map['textColor']}')),
    );
    return job;
  }
}
