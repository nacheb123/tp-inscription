
import 'package:flutter/material.dart';
import 'screens/step_one_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inscription en 3 étapes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00A8CC),
        ),
        scaffoldBackgroundColor: const Color(0xFFF2F7F9),
        useMaterial3: true,
      ),
      home: const StepOneScreen(),
    );
  }
}
