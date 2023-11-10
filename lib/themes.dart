import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle primary = ElevatedButton.styleFrom(
    backgroundColor: Colors.blueAccent,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
  );

  static ButtonStyle likeButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.lightGreen,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
  );

  static ButtonStyle dislikeButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
  );
}

class TextStyles {
  static TextStyle bold16 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static TextStyle italic18 = const TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.italic,
  );

  static TextStyle bold20 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold24 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}
