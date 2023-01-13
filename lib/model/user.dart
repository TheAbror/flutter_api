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
  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName(
      title: e['name']['title'],
      first: e['name']['first'],
      last: e['name']['last'],
    );
    final picture = Picture(picture: e['picture']['thumbnail']);
    final country = Country(country: e['location']['country']);
    return User(
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
      gender: e['gender'],
      name: name,
      country: country,
      picture: picture,
    );
  }

  String get fullName {
    return '${name.title}.${name.first} ${name.last}';
  }
}
