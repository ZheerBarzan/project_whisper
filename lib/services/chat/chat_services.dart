import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_whisper/model/messege.dart';

class ChatService {
// get instance of fireStore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

//get user stream

/*

List<Map<String, dynamic>> = 

{
  "email": "test@gmail.com",
  "id" : ...
}
  
}

 */

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) {
            final user = doc.data();

            return user;
          })
          .toList()
          .cast<Map<String, dynamic>>();
    });
  }

//send message

  Future<void> sendMessage(String reciverID, String messege) async {
    // get the current user info

    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create new messege
    Messege newMessege = Messege(
      senderID: currentUserId,
      senderEmail: currentUserEmail,
      reciverID: reciverID,
      messege: messege,
      timestamp: timestamp,
    );

    //make a chat room for these 2 users (sorted to ensure uniqueness)

    List<String> usersIds = [currentUserId, reciverID];
    usersIds
        .sort(); // sort the ids to make sure they any 2 people have the same chat room id

    final String chatRoomId = usersIds.join("_");
    //add new messege to the database

    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessege.toMap());
  }

//get message

  Stream<QuerySnapshot> getMessages(String currentUserId, String reciverID) {
//make a chat room for these 2 users (sorted to ensure uniqueness)
    List<String> usersIds = [currentUserId, reciverID];
    usersIds.sort();

    final String chatRoomId = usersIds.join("_");

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
