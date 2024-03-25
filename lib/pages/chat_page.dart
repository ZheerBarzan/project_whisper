import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String reciverEmail;
  const ChatPage({super.key, required this.reciverEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reciverEmail),
      ),
    );
  }
}
