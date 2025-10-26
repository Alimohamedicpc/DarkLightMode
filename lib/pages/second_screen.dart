import 'package:dark_light/main.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkMode,
      builder: (context, dark, _) {
        return Scaffold(
          backgroundColor: dark ? const Color(0xFF1C1C1E) : Colors.white,
          appBar: AppBar(title: const Text("Second Screen")),
          body: Center(
            child: Text(
              dark ? "Dark Mode is Active 🌙" : "Light Mode is Active ☀️",
              style: TextStyle(
                fontSize: 22,
                color: dark ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
