import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addMessage(String chtaroomId, String message, String sender, String emoji,
      String message_id) async {
    DateTime now = DateTime.now();

    await _firestore
        .collection('messages')
        .doc(chtaroomId)
        .collection('msgList')
        .add({
      "message": message,
      "sender": sender,
      "add_time": "${now.hour}:${now.minute}",
      "chat_date": DateTime.now(),
      "message_type": "text",
      "favorite": false,
      "stats": false,
      "redirectiond": false,
      "redirectiondMessage": "",
      "message_id": message_id,
      "emoji": emoji
    });
  }

  addRedirectiondMessage(String chtaroomId, String message, String sender,
      String redirectiondMessage, String emoji, String messageType) async {
    DateTime now = DateTime.now();

    await _firestore
        .collection('messages')
        .doc(chtaroomId)
        .collection('msgList')
        .add({
      "redirectiondMessage": redirectiondMessage,
      "message": message,
      "sender": sender,
      "add_time": "${now.hour}:${now.minute}",
      "chat_date": DateTime.now(),
      "message_type": messageType,
      "favorite": false,
      "stats": false,
      "redirectiond": true,
      "emoji": emoji
    });
  }

  addImage(String chtaroomId, String image, String sender) async {
    DateTime now = DateTime.now();

    await _firestore
        .collection('messages')
        .doc(chtaroomId)
        .collection('msgList')
        .add({
      "message": image,
      "sender": sender,
      "add_time": "${now.hour}:${now.minute}",
      "chat_date": DateTime.now(),
      "message_type": "image",
      "favorite": false,
      "stats": false,
      "redirectiond": false,
      "redirectiondMessage": "",
      "emoji": ""
    });
  }

  addFile(
      String chtaroomId, String file, String sender, String file_name) async {
    DateTime now = DateTime.now();

    await _firestore
        .collection('messages')
        .doc(chtaroomId)
        .collection('msgList')
        .add({
      "message": file,
      "sender": sender,
      "add_time": "${now.hour}:${now.minute}",
      "chat_date": DateTime.now(),
      "message_type": "file",
      "file_name": file_name,
      "stats": false,
    });
  }

  addvideo(String chtaroomId, String video, String sender,
      String video_image) async {
    DateTime now = DateTime.now();

    await _firestore
        .collection('messages')
        .doc(chtaroomId)
        .collection('msgList')
        .add({
      "message": video,
      "sender": sender,
      "add_time": "${now.hour}:${now.minute}",
      "chat_date": DateTime.now(),
      "message_type": "video",
      "video_image": video_image,
      "favorite": false,
      "stats": false,
      "redirectiond": false,
      "redirectiondMessage": "",
      "emoji": "",
    });
  }

  addVoise(String chtaroomId, String voise, String sender) async {
    DateTime now = DateTime.now();

    await _firestore
        .collection('messages')
        .doc(chtaroomId)
        .collection('msgList')
        .add({
      "message": voise,
      "sender": sender,
      "add_time": "${now.hour}:${now.minute}",
      "chat_date": DateTime.now(),
      "message_type": "voise",
      "favorite": false,
      "stats": false,
      "redirectiond": false,
      "redirectiondMessage": "",
      "emoji": ""
    });
  }

  voiseStats(String chtaroomId, bool stats, String message_id) async {
    await _firestore
        .collection('messages')
        .doc(chtaroomId)
        .collection('msgList')
        .doc(message_id)
        .update({
      "stats": stats,
    });
  }

  updateLastmessage(String last_msg, String id) {
    _firestore.collection("messages").doc(id).update({
      "last_message": last_msg,
    });
  }

  addEmoji(String room_id, String message_id, String emoji) {
    _firestore
        .collection("messages")
        .doc(room_id)
        .collection("msgList")
        .doc(message_id)
        .update({
      "favorite": true,
      "emoji": emoji,
    });
  }

  delete_message(String room_id, String message_id) {
    _firestore
        .collection("messages")
        .doc(room_id)
        .collection("msgList")
        .doc(message_id)
        .delete();
  }

  delete_chat(String room_id) async {
    final snapshot = await _firestore
        .collection("messages")
        .doc(room_id)
        .collection("msgList")
        .get();

    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessage(String chatroomId) {
    return _firestore
        .collection('messages')
        .doc(chatroomId)
        .collection('msgList')
        .orderBy("chat_date")
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getChatRoomData(
      String chatroomId) {
    return _firestore.collection('messages').doc(chatroomId).snapshots();
  }
}
