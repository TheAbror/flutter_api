import 'dart:convert';
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

  List<dynamic> users = [];
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
          final email = user['email'];
          final image = user['picture']['thumbnail'];
          final name = user['name']['first'];
          final familyName = user['name']['last'];
          final location = user['location']['country'];
          final latitude = user['location']['coordinates']['latitude'];
          final longitude = user['location']['coordinates']['longitude'];
          return GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 100,
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(image),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(name),
                                const Text(' '),
                                Text(
                                  familyName,
                                ),
                                // Spacer(),
                              ],
                            ),
                            Text(
                              email,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Latitude:' + latitude,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Longitude:' + longitude,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          location,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
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
    setState(() {
      users = json['results'];
    });
  }
}
