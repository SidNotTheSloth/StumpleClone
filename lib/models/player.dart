class Player {
  final String name;
  final String nation;
  final String role;
  final int debutYear;
  final String battingHand;
  final int totalMatches;
  final String team;
  bool isGuessed; // <-- only this added

  Player({
    required this.name,
    required this.nation,
    required this.role,
    required this.debutYear,
    required this.battingHand,
    required this.totalMatches,
    required this.team,
    this.isGuessed = false, // <-- default false
  });
}
