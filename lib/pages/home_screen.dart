import 'package:dark_light/main.dart';
import 'package:dark_light/pages/second_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkMode,
      builder: (context, dark, _) {
        return Scaffold(
          backgroundColor: dark ? const Color(0xFF1C1C1E) : Colors.white,
          appBar: AppBar(
            title: const Text("Home Screen"),
            actions: [
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SecondScreen()),
                ),
              ),
            ],
          ),
          body: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () =>
                        isDarkMode.value = !isDarkMode.value, // toggle mode
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                      width: 85,
                      height: 50,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          colors: dark
                              ? [
                                  const Color(0xFF2C2C2C),
                                  const Color(0xFF000000),
                                ]
                              : [Colors.white, Colors.grey.shade200],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: dark
                                ? Colors.black54
                                : Colors.grey.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          AnimatedAlign(
                            duration: const Duration(milliseconds: 600),
                            alignment: dark
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            curve: Curves.easeInOut,
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: dark
                                    ? const Color(0xFFE0E0E0)
                                    : Colors.amberAccent,
                                boxShadow: [
                                  BoxShadow(
                                    color: dark
                                        ? Colors.white24
                                        : Colors.amberAccent.withOpacity(0.5),
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Icon(
                                dark ? Icons.nightlight_round : Icons.wb_sunny,
                                color: dark ? Colors.grey[800] : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
