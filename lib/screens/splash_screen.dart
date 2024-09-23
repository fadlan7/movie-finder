import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, '/home-page');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/video.png',
              fit: BoxFit.cover,
              width: 150,
            ),
            const SizedBox(height: 10.0),
            const Text('Movie Finder',
                style: TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
