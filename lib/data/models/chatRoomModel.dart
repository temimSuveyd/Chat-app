import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomsModel {
  String? chatRoom_id;
  List? email;
  String? from_avatar;
  String? from_name;
  String? form_uid;
  String? last_msg;
  String? last_time;
  String? to_avatar;
  String? to_name;
  String? to_uid;
  ChatRoomsModel(
      this.chatRoom_id,
      this.email,
      this.form_uid,
      this.from_avatar,
      this.from_name,
      this.last_time,
      this.last_msg,
      this.to_avatar,
      this.to_name,
      this.to_uid);
  ChatRoomsModel.fromJson(QueryDocumentSnapshot   mapToJson) {
    // chat room id
    chatRoom_id = mapToJson["chatRoom_id"];
    // email list
    email = mapToJson["email"];
    // from
    from_avatar = mapToJson["from_avatar"];
    from_name = mapToJson["from_name"];
    form_uid = mapToJson["from_uid"];
    // to
    to_avatar = mapToJson["to_avatar"];
    to_name = mapToJson["to_name"];
    // to_uid = mapToJson["to_uid"];
    
    // last
    last_msg = mapToJson["last_message"];
    last_time = mapToJson["last_time"];
  }
}
