import 'package:flutter/material.dart';
import 'package:macom/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Comic',
      home: SplashScreen(),
    );
  }
}
