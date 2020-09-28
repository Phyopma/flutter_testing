import 'package:json_annotation/json_annotation.dart';
part 'userdetail.g.dart';

@JsonSerializable()
class UserDetail {
  final String login;
  @JsonKey(name: 'avatar_url')
  final String avatar;
  final int followers;
  final int following;
  final String url;

  UserDetail(
      {this.login, this.avatar, this.followers, this.following, this.url});

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}
