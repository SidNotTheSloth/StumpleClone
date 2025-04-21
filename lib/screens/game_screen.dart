import 'package:flutter/material.dart';
import '../data/sample_players.dart';
import '../models/player.dart';
import '../widgets/guess_input.dart';
import '../widgets/player_row.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Player targetPlayer;
  final List<Player> guessedPlayers = [];

  @override
  void initState() {
    super.initState();
    // Pick a random player as the target
    targetPlayer = (samplePlayers.toList()..shuffle()).first;
  }

  void _guessPlayer(String guess) {
    guess = guess.trim().toLowerCase();
    final index =
        samplePlayers.indexWhere((p) => p.name.toLowerCase() == guess);

    if (index == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No such player!')),
      );
      return;
    }

    final guessed = samplePlayers[index];

    if (guessedPlayers.contains(guessed)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Already guessed!')),
      );
      return;
    }

    setState(() {
      guessedPlayers.add(guessed);
    });

    if (guessed == targetPlayer) {
      Future.delayed(const Duration(milliseconds: 500), () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Congratulations!'),
            content: Text('You guessed the player: ${targetPlayer.name}!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    guessedPlayers.clear();
                    targetPlayer = (samplePlayers.toList()..shuffle()).first;
                  });
                },
                child: const Text('Play Again'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).popUntil((route) => route.isFirst),
                child: const Text('Home'),
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stumple(RCB & CSK only)'),
      ),
      body: Column(
        children: [
          GuessInput(onGuess: _guessPlayer),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Guess the mystery player!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: guessedPlayers.isEmpty
                ? const Center(child: Text('Start guessing!'))
                : ListView.builder(
                    itemCount: guessedPlayers.length,
                    itemBuilder: (context, index) {
                      final player = guessedPlayers[index];
                      return PlayerRow(
                        player: player,
                        target: targetPlayer,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
