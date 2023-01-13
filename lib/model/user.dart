import 'package:flutter_rest_api/model/users_country.dart';
import 'package:flutter_rest_api/model/users_name.dart';
import 'package:flutter_rest_api/model/users_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final UserName name;
  final Picture picture;
  final Country country;

  User({
    required this.email,
    required this.phone,
    required this.cell,
    required this.name,
    required this.gender,
    required this.picture,
    required this.country,
  });
}
