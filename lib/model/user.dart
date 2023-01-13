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

class UserName {
  final String title;
  final String first;
  final String last;
  UserName({
    required this.title,
    required this.first,
    required this.last,
  });
}

class Picture {
  final String picture;
  Picture({required this.picture});
}

class Country {
  final String country;
  Country({required this.country});
}
