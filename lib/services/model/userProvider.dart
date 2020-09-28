import 'package:counter/services/userdetail.dart';

import 'usermodel.dart';
import 'package:http/http.dart';
import 'dart:convert';

class UserProvider {
  static String baseurl = 'http://api.github.com/users';

  static Future<List<UserModel>> fetchusers() async {
    Response response = await get(baseurl);
    List<dynamic> users = jsonDecode(response.body);
    return users.map((json) => UserModel.fromJson(json)).toList();
  }

  static Future<UserDetail> fetchdetail(String login) async {
    Response res = await get('$baseurl/$login');
    Map<String, dynamic> user = jsonDecode(res.body);
    return UserDetail.fromJson(user);
  }
}
