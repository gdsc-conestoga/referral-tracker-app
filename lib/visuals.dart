import 'package:flutter/material.dart';

class CustomColours {
  static const MaterialColor conestogaBlack =
      MaterialColor(0xFF000000, <int, Color>{
    50: Color.fromRGBO(0, 0, 0, .1),
    100: Color.fromRGBO(0, 0, 0, .2),
    200: Color.fromRGBO(0, 0, 0, .3),
    300: Color.fromRGBO(0, 0, 0, .4),
    400: Color.fromRGBO(0, 0, 0, .5),
    500: Color.fromRGBO(0, 0, 0, .6),
    600: Color.fromRGBO(0, 0, 0, .7),
    700: Color.fromRGBO(0, 0, 0, .8),
    800: Color.fromRGBO(0, 0, 0, .9),
    900: Color.fromRGBO(0, 0, 0, 1),
  });

  static const MaterialColor conestogaGold =
      MaterialColor(0xFFBB9046, <int, Color>{
    50: Color.fromRGBO(187, 144, 70, .1),
    100: Color.fromRGBO(187, 144, 70, .2),
    200: Color.fromRGBO(187, 144, 70, .3),
    300: Color.fromRGBO(187, 144, 70, .4),
    400: Color.fromRGBO(187, 144, 70, .5),
    500: Color.fromRGBO(187, 144, 70, .6),
    600: Color.fromRGBO(187, 144, 70, .7),
    700: Color.fromRGBO(187, 144, 70, .8),
    800: Color.fromRGBO(187, 144, 70, .9),
    900: Color.fromRGBO(187, 144, 70, 1),
  });

  static const MaterialColor conestogaWhite =
      MaterialColor(0xFFFFFFFF, <int, Color>{
    50: Color.fromRGBO(255, 255, 255, .1),
    100: Color.fromRGBO(255, 255, 255, .2),
    200: Color.fromRGBO(255, 255, 255, .3),
    300: Color.fromRGBO(255, 255, 255, .4),
    400: Color.fromRGBO(255, 255, 255, .5),
    500: Color.fromRGBO(255, 255, 255, .6),
    600: Color.fromRGBO(255, 255, 255, .7),
    700: Color.fromRGBO(255, 255, 255, .8),
    800: Color.fromRGBO(255, 255, 255, .9),
    900: Color.fromRGBO(255, 255, 255, 1),
  });
}

const AppBarTheme trackerAppBarTheme = AppBarTheme(
  backgroundColor: CustomColours.conestogaBlack,
);

const TextStyle trackerAppBarTextStyle = TextStyle(
  color: CustomColours.conestogaGold,
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);

const TextStyle trackerLoginButtonStyle = TextStyle(
  color: CustomColours.conestogaWhite,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

const Text trackerTitle = Text(
  "Referral Tracker",
  style: trackerAppBarTextStyle,
);
