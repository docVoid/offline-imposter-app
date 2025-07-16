# offline-imposter-app

A simple offline party game for groups, where players try to find the imposter among them.

## Features

- Playable offline with friends
- Simple rules and quick rounds
- Designed for mobile devices

## Project Structure

```
lib/
├── main.dart              # App entry point
├── app.dart               # MaterialApp, theme, routing
├── models/
│   └── player.dart        # Player class with name, role, word
├── screens/
│   ├── home_screen.dart
│   ├── setup_screen.dart
│   ├── reveal_screen.dart
│   └── result_screen.dart
├── widgets/
│   ├── player_input_list.dart
│   └── reveal_card.dart
├── services/
│   ├── game_logic.dart    # Roles, shuffle, word selection
│   └── word_pool.dart     # Random word from word list
└── constants/
    └── words.dart         # Word list as constant
```

- `/dev.md` – Step-by-step guide for local development and testing
- `/README.md` – Project overview and documentation

## Getting Started

See [dev.md](./dev.md) for instructions on how to set up and test the project locally (Android emulator, iOS simulator, physical Android device).

## Repository

[https://github.com/docVoid/offline-imposter-app](https://github.com/docVoid/offline-imposter-app)

## License

MIT License

## Contributing

Feel free to open issues or submit pull requests to improve the game!

