import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/player_input_list.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  int playerCount = 3;
  int imposterCount = 1;
  List<String> names = List.filled(3, '');
  String? error;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedNames = prefs.getStringList('playerNames');
    final savedImposters = prefs.getInt('imposterCount');

    if (savedNames != null && savedNames.isNotEmpty) {
      setState(() {
        names = savedNames;
        playerCount = savedNames.length;
        imposterCount = savedImposters != null && savedImposters < playerCount
            ? savedImposters
            : 1;
      });
    }
  }

  void updateName(int index, String value) {
    setState(() {
      names[index] = value;
    });
  }

  void updatePlayerCount(int value) {
    setState(() {
      playerCount = value;
      names = List.filled(playerCount, '');
      if (imposterCount >= playerCount) imposterCount = playerCount - 1;
    });
  }

  void updateImposterCount(int value) {
    setState(() {
      imposterCount = value;
    });
  }

  bool validate() {
    final nameSet = names.toSet();
    if (names.any((n) => n.trim().isEmpty)) {
      error = 'Alle Namen müssen ausgefüllt sein.';
      return false;
    }
    if (nameSet.length != names.length) {
      error = 'Namen dürfen nicht doppelt sein.';
      return false;
    }
    if (imposterCount < 1 || imposterCount >= playerCount) {
      error = 'Ungültige Anzahl an Impostern.';
      return false;
    }
    error = null;
    return true;
  }

  void startGame() async {
    if (validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('playerNames', names);
      await prefs.setInt('imposterCount', imposterCount);

      Navigator.pushNamed(
        context,
        '/reveal',
        arguments: {
          'names': names,
          'imposterCount': imposterCount,
        },
      );
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              children: [
                const Text('Spieleranzahl:'),
                const SizedBox(width: 16),
                DropdownButton<int>(
                  value: playerCount,
                  items: List.generate(10, (i) => i + 3)
                      .map((v) => DropdownMenuItem(value: v, child: Text('$v')))
                      .toList(),
                  onChanged: (v) => updatePlayerCount(v!),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Imposter:'),
                const SizedBox(width: 16),
                DropdownButton<int>(
                  value: imposterCount,
                  items: List.generate(playerCount - 1, (i) => i + 1)
                      .map((v) => DropdownMenuItem(value: v, child: Text('$v')))
                      .toList(),
                  onChanged: (v) => updateImposterCount(v!),
                ),
              ],
            ),
            const SizedBox(height: 16),
            PlayerInputList(names: names, onNameChanged: updateName),
            if (error != null)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(error!, style: const TextStyle(color: Colors.red)),
              ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: startGame,
              child: const Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
