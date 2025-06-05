import 'package:json_annotation/json_annotation.dart';

part 'interviews_model.g.dart';


@JsonSerializable(createToJson: false)
class InterviewsModel {
  final int id;
  final String user;
  final String title;
  final String image;
  final int duration;

  InterviewsModel({
    required this.id,
    required this.title,
    required this.user,
    required this.image,
    required this.duration,
  });

  factory InterviewsModel.fromJson(Map<String, dynamic>json)=> _$InterviewsModelFromJson(json);
}