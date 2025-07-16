import 'package:flutter/material.dart';
import '../models/player.dart';
import '../services/game_logic.dart';
import '../services/word_pool.dart';
import '../widgets/reveal_card.dart';

class RevealScreen extends StatefulWidget {
  const RevealScreen({super.key});

  @override
  State<RevealScreen> createState() => _RevealScreenState();
}

class _RevealScreenState extends State<RevealScreen> {
  late List<Player> players;
  int currentIndex = 0;
  late Player startPlayer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final names = args['names'] as List<String>;
    final imposterCount = args['imposterCount'] as int;
    final word = WordPool.getRandomWord();
    players = GameLogic.assignRoles(names, imposterCount, word);
    players = GameLogic.shufflePlayers(players);
    startPlayer = GameLogic.pickStartPlayer(players);
  }

  void nextPlayer() {
    if (currentIndex < players.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pushReplacementNamed(
        context,
        '/result',
        arguments: {
          'players': players,
          'startPlayer': startPlayer,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final player = players[currentIndex];
    final displayText = player.role == PlayerRole.imposter
        ? 'Imposter'
        : player.word ?? '';
    return Scaffold(
      body: RevealCard(
        displayText: displayText,
        onNext: nextPlayer,
      ),
    );
  }
}