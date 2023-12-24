import 'package:flutter/material.dart';
import 'package:mb_hw4/screens/first_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late SharedPreferences _prefs;
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFirstTime = _prefs.getBool('isFirstTime') ?? true;
    });
  }

  Future<void> _markNotFirstTime() async {
    await _prefs.setBool('isFirstTime', false);
  }

  @override
  Widget build(BuildContext context) {
    return _isFirstTime ? _buildIntroPage() : const FirstScreen();
  }

  Widget _buildIntroPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Intro Page',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Welcome To My App !',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 20.0),
              const Image(
                  image: NetworkImage(
                      'https://mma.prnewswire.com/media/1633444/Welcome_Logo.jpg?w=450')),
              const SizedBox(height: 20.0),
              const Text(
                'Welcome to Our App! '
                'Explore exciting features and functionalities. '
                'Get started and make the most of your experience! '
                'Enjoy your journey with Our App!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _markNotFirstTime();
                  Navigator.pushNamed(context, 'first');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
