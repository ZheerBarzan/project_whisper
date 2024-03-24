import 'package:flutter/material.dart';
import 'package:project_whisper/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}
