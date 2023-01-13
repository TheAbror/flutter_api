import 'package:flutter_rest_api/model/user.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  static Future<List<User>> fetcgUsers() async {
    const url = 'https://randomuser.me/api/?results=95';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }
}
