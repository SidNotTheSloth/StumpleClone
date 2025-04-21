import 'package:flutter/material.dart';

class GuessInput extends StatefulWidget {
  final void Function(String) onGuess;

  GuessInput({required this.onGuess});

  @override
  _GuessInputState createState() => _GuessInputState();
}

class _GuessInputState extends State<GuessInput> {
  final controller = TextEditingController();

  void submit() {
    final guess = controller.text.trim();
    if (guess.isNotEmpty) {
      widget.onGuess(guess);
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Guess a player'),
              onSubmitted: (_) => submit(),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: submit,
          ),
        ],
      ),
    );
  }
}
