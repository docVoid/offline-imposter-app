enum PlayerRole { normal, imposter }

class Player {
  final String name;
  PlayerRole role;
  String? word;

  Player({required this.name, required this.role, this.word});
}