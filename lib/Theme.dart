import 'package:flutter/material.dart';

var KLightScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 48, 143, 148),
);
ThemeData LightTheme = ThemeData().copyWith(
  colorScheme: KLightScheme,
);

var KDarkScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 116, 110, 199),
  brightness: Brightness.dark,
);
ThemeData DarkTheme = ThemeData.dark().copyWith(
  colorScheme: KDarkScheme,
);
