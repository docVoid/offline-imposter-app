import 'package:flutter/material.dart';

class RevealCard extends StatelessWidget {
  final String displayText;
  final VoidCallback onNext;

  const RevealCard({
    super.key,
    required this.displayText,
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
                displayText,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onNext,
                child: const Text('Weitergeben'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}