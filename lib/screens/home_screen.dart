import 'package:flutter/material.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stumple')),
      body: Center(
        child: ElevatedButton(
          child: Text('Start Game'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GameScreen()),
            );
          },
        ),
      ),
    );
  }
}
