import 'package:dev_flutter/components/task.dart';
import 'package:dev_flutter/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(color: Colors.blue),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: const [
          Task('Aprender Flutter', 'assets/images/loki.jpg', 1),
          Task('Violão', 'assets/images/loki.jpg', 4),
          Task('Rezar', 'assets/images/loki.jpg', 1),
          Task('História', 'assets/images/loki.jpg', 5),
          Task('Jogar', 'assets/images/loki.jpg', 2),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FormScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
      ),
    );
  }
}
