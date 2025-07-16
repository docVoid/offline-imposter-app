import 'package:flutter/material.dart';

class RevealCard extends StatelessWidget {
  final String playerName;
  final String? displayText;
  final bool isRevealed;
  final VoidCallback onReveal;
  final VoidCallback onNext;

  const RevealCard({
    super.key,
    required this.playerName,
    required this.displayText,
    required this.isRevealed,
    required this.onReveal,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(32),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Spieler: $playerName',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              if (!isRevealed)
                ElevatedButton(
                  onPressed: onReveal,
                  child: const Text('Aufdecken'),
                )
              else ...[
                Text(
                  displayText ?? '',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: onNext,
                  child: const Text('Weitergeben'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
