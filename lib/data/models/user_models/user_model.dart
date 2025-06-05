import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? gender;
  final DateTime birthDate;

  UserModel({
    required this.email,
    required this.lastName,
    required this.phoneNumber,
    required this.firstName,
    required this.id,
    required this.gender,
    required this.birthDate,
  });

  /// ✅ Safe default user to avoid null
  factory UserModel.empty() {
    return UserModel(
      id: 0,
      firstName: '',
      lastName: '',
      email: '',
      phoneNumber: '',
      gender: null,
      birthDate: DateTime(2000, 1, 1),
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
