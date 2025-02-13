import 'package:cloud_firestore/cloud_firestore.dart';

class Usersdata {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addUser(String name, String email, String id , String image,String token) async {
    _firestore.collection("Users").doc(id).set({
      "add_time": DateTime.now().toString(),
      "email": email,
      "name": name,
      "id": id,
      "image":image , 
      "token":token
    });
  }



updateToken(String id ,String token){
    _firestore.collection("Users").doc(id).update({
      "token":token
    });
}






    updateData(String name , String image , String id ) async {
    _firestore.collection("Users").doc(id).update({
      "add_time": DateTime.now().toString(),
      "name": name,
      "image":image
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUser(String email) {
    return _firestore
        .collection('Users')
        .where("email", isEqualTo: email)
        .snapshots();
  }
}
