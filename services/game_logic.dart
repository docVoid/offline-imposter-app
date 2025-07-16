import '../models/player.dart';
import 'word_pool.dart';
import 'dart:math';

class GameLogic {
  static List<Player> assignRoles(
      List<String> names, int imposterCount, String word) {
    final rand = Random();
    final shuffledNames = List<String>.from(names)..shuffle(rand);
    final imposterIndices = List<int>.generate(names.length, (i) => i)
      ..shuffle(rand);
    final imposters = imposterIndices.take(imposterCount).toSet();

    return List<Player>.generate(names.length, (i) {
      final role = imposters.contains(i) ? PlayerRole.imposter : PlayerRole.normal;
      return Player(
        name: shuffledNames[i],
        role: role,
        word: role == PlayerRole.normal ? word : null,
      );
    });
  }

  static List<Player> shufflePlayers(List<Player> players) {
    final rand = Random();
    final shuffled = List<Player>.from(players)..shuffle(rand);
    return shuffled;
  }

  static Player pickStartPlayer(List<Player> players) {
    final rand = Random();
    return players[rand.nextInt(players.length)];
  }
}