import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(StumpleCloneApp());
}

class StumpleCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stumple',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
