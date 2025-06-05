// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interviews_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterviewsModel _$InterviewsModelFromJson(Map<String, dynamic> json) =>
    InterviewsModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      user: json['user'] as String,
      image: json['image'] as String,
      duration: (json['duration'] as num).toInt(),
    );
