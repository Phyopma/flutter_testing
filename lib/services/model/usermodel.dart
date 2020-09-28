import 'package:json_annotation/json_annotation.dart';

part 'usermodel.g.dart';

@JsonSerializable()
class UserModel {
  final String login;
  final int id;
  @JsonKey(name: 'avatar_url')
  final String avatar;
  final String url;

  UserModel({this.login, this.id, this.avatar, this.url});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
