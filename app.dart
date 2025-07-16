import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/setup_screen.dart';
import 'screens/reveal_screen.dart';
import 'screens/result_screen.dart';

class ImposterApp extends StatelessWidget {
  const ImposterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imposter',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/setup': (context) => const SetupScreen(),
        '/reveal': (context) => const RevealScreen(),
        '/result': (context) => const ResultScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}