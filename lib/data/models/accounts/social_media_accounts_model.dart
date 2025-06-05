import 'package:json_annotation/json_annotation.dart';

part 'social_media_accounts_model.g.dart';

@JsonSerializable(createToJson: false)
class SocialMediaAccountsModel {
  final int id;
  final String title;
  final String link;
  final String icon;

  SocialMediaAccountsModel({
    required this.title,
    required this.icon,
    required this.id,
    required this.link,
  });

  factory SocialMediaAccountsModel.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaAccountsModelFromJson(json);
}