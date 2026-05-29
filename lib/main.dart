import 'package:challengefigma/screens/bike_login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChallengeFigmaApp());
}

class ChallengeFigmaApp extends StatelessWidget {
  const ChallengeFigmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike Challenge Figma',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0f172a),
      ),
      home: const BikeLoginScreen(),
    );
  }
}