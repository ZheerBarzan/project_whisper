import 'package:flutter/material.dart';
import 'package:project_whisper/components/my_drawer.dart';
import 'package:project_whisper/components/user_tile.dart';
import 'package:project_whisper/pages/chat_page.dart';
import 'package:project_whisper/services/auth/auth_service.dart';
import 'package:project_whisper/services/chat/chat_services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthService _authService = AuthService();
  final ChatService _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

// build a user list except for the current login in user
  Widget _buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        }
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Column(
              children: [
                Text("Loading..."),
                CircularProgressIndicator(),
              ],
            ),
          );
        }

        // return list of users

        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  //build individual user list item
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all user except the current user

    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData['email'],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                reciverEmail: userData['email'],
                reciverID: userData['uid'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
