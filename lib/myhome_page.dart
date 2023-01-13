import 'dart:convert';
import 'package:flutter_rest_api/model/user.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: ((context, index) {
          final user = users[index];
          final email = user.email;
          return GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 100,
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(user.picture.picture),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("${user.name.title}."),
                                  Text(user.name.first),
                                  const Text(' '),
                                  Text(user.name.last),
                                ],
                              ),
                              Text(
                                email,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                user.gender,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '+1 ${user.cell}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            user.country.country,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void getUsers() async {
    const url = 'https://randomuser.me/api/?results=95';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map(
      (e) {
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
          picture: picture,
          country: country,
        );
      },
    ).toList();
    setState(() {
      users = transformed;
    });
  }
}
