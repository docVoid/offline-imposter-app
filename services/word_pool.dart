import '../constants/words.dart';
import 'dart:math';

class WordPool {
  static String getRandomWord() {
    final rand = Random();
    return wordPool[rand.nextInt(wordPool.length)];
  }
}