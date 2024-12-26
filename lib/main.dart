import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/services.dart';

var kColorScheme =
  ColorScheme.fromSeed(seedColor: const Color.fromARGB(121, 22, 16, 212));

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.black,
  primary: Colors.grey[900],
  onPrimary: Colors.white,
  secondary: Colors.grey[800],
  onSecondary: Colors.white,
  surface: Colors.grey[850],
  onSurface: Colors.white,
  surfaceVariant: Colors.black,
  onSurfaceVariant: Colors.white,
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((fn) {

    runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kDarkColorScheme.primary,
          foregroundColor: kDarkColorScheme.onPrimary,
        ),
        cardTheme: CardTheme(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: kDarkColorScheme.onSecondaryContainer,
          ),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme.copyWith(
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary,
        ),
        cardTheme: CardTheme(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: kColorScheme.onSecondaryContainer,
          ),
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      themeMode: ThemeMode.system,
      home: Expenses(),
    ),
  );    

  });
  

}
