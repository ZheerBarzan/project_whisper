import 'package:cloud_firestore/cloud_firestore.dart';

class Messege {
  final String senderID;
  final String senderEmail;
  final String reciverID;
  final String messege;
  final Timestamp timestamp;

  Messege(
      {required this.senderID,
      required this.senderEmail,
      required this.reciverID,
      required this.messege,
      required this.timestamp});

//convert to a map

  Map<String, dynamic> toMap() {
    return {
      "senderID": senderID,
      "senderEmail": senderEmail,
      "reciverID": reciverID,
      "messege": messege,
      "timestamp": timestamp
    };
  }
}
