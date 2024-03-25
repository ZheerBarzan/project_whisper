import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
// get instance of fireStore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
    return _firestore.collection("users").snapshots().map((snapshot) {
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

//get message
}
