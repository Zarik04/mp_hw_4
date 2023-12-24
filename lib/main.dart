import 'package:flutter/material.dart';
import 'package:mb_hw4/screens/first_screen.dart';
import 'package:mb_hw4/screens/intro_page.dart';
import 'package:mb_hw4/screens/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'intro',
      routes: {
        'first': (context) => const FirstScreen(),
        'second': (context) => const SecondScreen(),
        'intro': (context) => const IntroPage(),
      },
    );
  }
}
