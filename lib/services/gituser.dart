import 'dart:convert';
import 'package:http/http.dart';

class GitUser {
  String login;
  Map user;

  GitUser({this.login});

  Future<void> getUserDetail() async {
    Response res = await get('http://api.github.com/users/$login');
    user = jsonDecode(res.body);
  }

  List<dynamic> users = [];

  Future<void> getUser() async {
    Response response = await get('http://api.github.com/users');
    users = jsonDecode(response.body).toList();
  }
}

// void main() {
//   GitUser user1 = GitUser();
//   user1.getUserDetail();
// }
