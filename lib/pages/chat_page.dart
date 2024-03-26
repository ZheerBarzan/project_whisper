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
    );
  }
}
