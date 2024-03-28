import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_whisper/services/auth/auth_service.dart';
import 'package:project_whisper/services/chat/chat_services.dart';

class ChatPage extends StatelessWidget {
  final String? reciverEmail;
  final String? reciverID;
  ChatPage({super.key, required this.reciverEmail, required this.reciverID});

// text messege controller
  final TextEditingController _messageController = TextEditingController();

//chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void sendMessage() async {
    // if not empty
    if (_messageController.text.isNotEmpty) {
      //send the message
      await _chatService.sendMessage(reciverID!, _messageController.text);

      //clear the text field
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(reciverEmail!),
        ),
        body: Column(children: [
          //messages list
          Expanded(
            child: _buildMessgesList(),
          ),
          //text field and send button
        ]));
  }

  Widget _buildMessgesList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(reciverID!, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessgesItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessgesItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Text(data['messege']);
  }
}
