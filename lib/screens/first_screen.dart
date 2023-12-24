import 'package:flutter/material.dart';
import 'package:mb_hw4/components/drawer_menu.dart';
import 'package:mb_hw4/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<User> users = [];
  get url_ => 'https://randomuser.me/api/?results=15';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'First Page',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        backgroundColor: Colors.indigo,
      ),
      drawer: const DrawerMenu(),
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 1),
        builder: (context, double value, child) {
          return Opacity(
            opacity: value,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, double itemAnimation, child) {
                    return Opacity(
                      opacity: itemAnimation,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.picture),
                          radius: 35,
                        ),
                        title: Text(
                          '${user.title}. ${user.firstName} ${user.lastName}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.email),
                            Text('Gender: ${user.gender}'),
                            Text('Phone: ${user.phone}'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 2),
        builder: (context, double value, child) {
          return Opacity(
            opacity: value,
            child: FloatingActionButton(
              backgroundColor: Colors.indigo.shade500,
              onPressed: fetch,
              child: const Icon(
                Icons.refresh,
                color: Colors.white,
                size: 28,
              ),
            ),
          );
        },
      ),
    );
  }

  void fetch() async {
    final uri = Uri.parse(url_);
    final response = await http.get(uri);

    String body = '';

    //if successful
    if (response.statusCode == 200) {
      body = response.body;
      //decode json and save to jsonData
      final jsonData = jsonDecode(body);
      List<User> jsonUsers = [];

      for (Map<String, dynamic> user in jsonData['results']) {
        final newUser = User.fromJson(user);
        jsonUsers.add(newUser);
      }

      setState(() {
        users = jsonUsers;
      });
    }
  }
}
