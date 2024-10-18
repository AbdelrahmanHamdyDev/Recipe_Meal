import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:meals/Screens/TabsHub.dart';
import 'package:meals/Theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) {
      runApp(
        ProviderScope(
          child: MaterialApp(
            theme: LightTheme,
            darkTheme: DarkTheme,
            home: MealsHub(),
          ),
        ),
      );
    },
  );
}
