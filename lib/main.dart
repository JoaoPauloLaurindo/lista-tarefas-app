import 'package:dev_flutter/data/task_inherited.dart';
import 'package:dev_flutter/screens/initial_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}
