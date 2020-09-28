// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) {
  return UserDetail(
    login: json['login'] as String,
    avatar: json['avatar_url'] as String,
    followers: json['followers'] as int,
    following: json['following'] as int,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatar,
      'followers': instance.followers,
      'following': instance.following,
      'url': instance.url,
    };
