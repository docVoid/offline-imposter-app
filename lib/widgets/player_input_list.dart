import 'package:flutter/material.dart';

class PlayerInputList extends StatelessWidget {
  final List<String> names;
  final Function(int, String) onNameChanged;

  const PlayerInputList({
    super.key,
    required this.names,
    required this.onNameChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(names.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Spieler ${index + 1}',
            ),
            onChanged: (value) => onNameChanged(index, value),
          ),
        );
      }),
    );
  }
}