import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class GitUser extends ChangeNotifier {
  String login;
  Map user;

  GitUser({this.login});

  Future<void> getUserDetail() async {
    Response res = await get('http://api.github.com/users/$login');
    user = jsonDecode(res.body);
    notifyListeners();
  }

  List<dynamic> users = [];

  List<dynamic> name = [];
  List<dynamic> avatar = [];

  Future<void> getUser() async {
    Response response = await get('http://api.github.com/users');
    users = jsonDecode(response.body).toList();
    name = users.map((e) => e['login']).toList();
    avatar = users.map((e) => e['avatar_url']).toList();
    notifyListeners();
  }
}
