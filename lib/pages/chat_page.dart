import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_whisper/components/chat_bubble.dart';
import 'package:project_whisper/components/my_textfiled.dart';
import 'package:project_whisper/services/auth/auth_service.dart';
import 'package:project_whisper/services/chat/chat_services.dart';

class ChatPage extends StatefulWidget {
  final String reciverEmail;
  final String reciverID;
  const ChatPage(
      {super.key, required this.reciverEmail, required this.reciverID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
// text messege controller
  final TextEditingController _messageController = TextEditingController();

//chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

// for textfiled foucs
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 500), () => scrollDown());
      }
    });
    Future.delayed(const Duration(milliseconds: 500), () => scrollDown());
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // scroll controller
  final ScrollController _scrollController = ScrollController();

  void scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.fastOutSlowIn);
  }

  void sendMessage() async {
    // if not empty
    if (_messageController.text.isNotEmpty) {
      //send the message
      await _chatService.sendMessage(widget.reciverID, _messageController.text);

      //clear the text field
      _messageController.clear();
    }

    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.reciverEmail),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(children: [
          //messages list
          Expanded(
            child: _buildMessgesList(),
          ),
          _buildUserInput(),
          //text field and send button
        ]));
  }

// build list of messages
  Widget _buildMessgesList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(widget.reciverID, senderID),
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
          controller: _scrollController,
          children:
              snapshot.data!.docs.map((doc) => _buildMessgesItem(doc)).toList(),
        );
      },
    );
  }

// build single message
  Widget _buildMessgesItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user

    bool isCrurentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    var messageAlign =
        isCrurentUser ? Alignment.centerRight : Alignment.centerLeft;

    //align messege to the right if sender is the current user other wise align to the left

    return Container(
      alignment: messageAlign,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isCrurentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(message: data['messege'], isCurrentUser: isCrurentUser),
        ],
      ),
    );
  }

  // build user input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: _messageController,
              obscureText: false,
              hintText: "Type a message",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(15),
              icon: const Icon(
                Icons.arrow_upward,
                size: 30,
                color: Colors.white,
              ),
              onPressed: sendMessage,
            ),
          )
        ],
      ),
    );
  }
}
