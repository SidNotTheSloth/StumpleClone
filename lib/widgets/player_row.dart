import 'package:flutter/material.dart';
import '../models/player.dart';

class PlayerRow extends StatelessWidget {
  final Player player;
  final Player target;

  const PlayerRow({
    Key? key,
    required this.player,
    required this.target,
  }) : super(key: key);

  Color _color(bool match) => match ? Colors.green : Colors.red;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Name: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  player.name,
                  style: TextStyle(
                    color: _color(player.name == target.name),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Nation: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  player.nation,
                  style:
                      TextStyle(color: _color(player.nation == target.nation)),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Role: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  player.role,
                  style: TextStyle(color: _color(player.role == target.role)),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Debut Year: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  player.debutYear.toString(),
                  style: TextStyle(
                      color: _color(player.debutYear == target.debutYear)),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Batting Hand: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  player.battingHand,
                  style: TextStyle(
                      color: _color(player.battingHand == target.battingHand)),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Matches: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  player.totalMatches.toString(),
                  style: TextStyle(
                      color:
                          _color(player.totalMatches == target.totalMatches)),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Team: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  player.team,
                  style: TextStyle(color: _color(player.team == target.team)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
