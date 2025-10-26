import 'package:dark_light/pages/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// Global theme controller shared across all screens
final ValueNotifier<bool> isDarkMode = ValueNotifier(false);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkMode,
      builder: (context, dark, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: dark ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const HomeScreen(),
        );
      },
    );
  }
}
