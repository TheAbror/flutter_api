import 'package:flutter_rest_api/model/user.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/services/user_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    getUsers();
  }

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(user.picture.picture.toString()),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.fullName),
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
                          flex: 2,
                          child: Text(
                            user.country.country,
                            textAlign: TextAlign.end,
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

  Future<void> getUsers() async {
    final response = await UserApi.fetcgUsers();
    setState(() {
      users = response;
    });
  }
}
