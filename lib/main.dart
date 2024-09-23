import 'package:flutter/material.dart';
import 'package:movie_finder/screens/home_page.dart';
import 'package:movie_finder/screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Finder',
      theme: ThemeData(),
      home: SplashScreen(),
      routes: {
        '/home-page': (context) => const MainScreen(),
      }
    );
  }
}