import 'package:chat_app/core/function/create_chatRoom_id.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomsData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// add data

  addUserToMyUsers(String myid, String email) async {
    await _firestore.collection('Users').doc(myid).collection("MyUsers").add({
      "email": email,
    });
  }

  addChatRoom(
      String fromAvatar,
      String fromName,
      String fromUid,
      String fromEmail,
      String fromToken,
      bool fromIsAdd,
      bool from_stats,
      String lastMsg,
      String lastTime,
      String toName,
      String toAvatar,
      String toEmail,
      String toToken,
      bool toIsAdd,
      bool to_stats,
      bool from_call_stats,
      bool to_call_stats,
      ) async {
    String chatRoomId = create_ChatRoom_id(fromEmail, toEmail);
    _firestore.collection('messages').doc(chatRoomId).set({
      "from_avatar": fromAvatar,
      "from_name": fromName,
      "from_uid": fromUid,
      "from_isAdd": fromIsAdd,
      "from_token": fromToken,
      "from_email": fromEmail,
      "from_stats": from_stats,
      "from_call_stats": from_call_stats,
      "last_message": lastMsg,
      "last_time": lastTime,
      "email": [fromEmail, toEmail],
      "to_stats": to_stats,
      "to_name": toName,
      "to_avatar": toAvatar,
      "to_isadd": toIsAdd,
      "chatRoom_id": chatRoomId,
      "to_email": toEmail,
      "to_token": toToken,
      "to_call_stats": to_call_stats,
    });
  }

  delteeChtaRoom(String chatRoom_id) {
    _firestore.collection('messages').doc(chatRoom_id).delete();
  }





  changeFrom_UserStats(String chatRoom_id, bool stats) {
    _firestore.collection('messages').doc(chatRoom_id).update({
      "from_stats": stats,
    });
  }





  changeTo_UserStats(String chatRoom_id, bool stats) {
    _firestore.collection('messages').doc(chatRoom_id).update({
      "to_stats": stats,
    });
  }



  changeFrom_call_stats(String chatRoom_id, bool stats) {
    _firestore.collection('messages').doc(chatRoom_id).update({
      "from_call_stats": stats,
    });
  }

  changeTo_call_stast(String chatRoom_id, bool stats) {
    _firestore.collection('messages').doc(chatRoom_id).update({
      "to_call_stats": stats,
    });
  }




  addStoryImage(String media, String sender) async {
    await _firestore.collection('story').add({
      "media": media,
      "sender": sender,
      "add_time": DateTime.now(),
      "message_type": "image",
    });
  }

  addStoryVideo(String media, String sender) async {
    await _firestore.collection('story').add({
      "media": media,
      "sender": sender,
      "add_time": DateTime.now(),
      "message_type": "video",
    });
  }

  updateuserAddedData(String id) {
    _firestore.collection("messages").doc(id).update({
      "to_isadd": true,
    });
  }

// get data
  Stream<QuerySnapshot<Map<String, dynamic>>> getStory(
      List myUsers, String meEmail) {
    return _firestore
        .collection('story')
        .where("sender", whereIn: myUsers)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatrooms(String userEmail) {
    return _firestore
        .collection('messages')
        .where("email", arrayContains: userEmail)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMyUsers(String myid) {
    return _firestore
        .collection('Users')
        .doc(myid)
        .collection("MyUsers")
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMeStory(String meEmail) {
    return _firestore
        .collection('story')
        .where("sender", isEqualTo: meEmail)
        .snapshots();
  }
}
