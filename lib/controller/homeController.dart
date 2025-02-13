// import 'dart:html' as html;
import 'dart:io';
import 'dart:ui';
import 'package:chat_app/core/class/stasusRecuest.dart';
import 'package:chat_app/core/constanst/color.dart';
import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:chat_app/data/datascore/remote/homeData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class HomeController extends GetxController {
  changeTapping(int index);
  goToAddUserPage();
  getChatRooms();
  goToChatRoom(String name, String chatroonId);
  search(String query);
  pickedVideo();
  pickedImage();
  getStory(userList);
  getMyUsers();
  addUserToMyUsers(String user_uid, String user_email, String name);
  updateuserAddedData(String id);
  goToVideoView(String media);
  goToImageView(String media);
  convertSnapshotToString(QueryDocumentSnapshot snapshot);
  deleteChatRoom(String chatroomId);
  requestPermission();
  init_style();
  updateUserStats();
}

class HomeControllerImp extends HomeController {
  int tapping = 0;
  AppService appService = Get.find();
  ChatRoomsData chatRoomsData = ChatRoomsData();
  late Stasusrecuest stasusrecuest;
  var rooms = [].obs;
  var storys = [].obs;
  var myUsers = [].obs;
  List searchRooms = [];
  List myusers_List = [];
  int length = 0;
  String searc = "";
  final imagePicker = ImagePicker();
  bool isAdded = false;
  bool user_stats = false;
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<String> convertSnapshotToString(QueryDocumentSnapshot snapshot) async {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    String jsonString = data.toString();
    return jsonString;
  }

  @override
  changeTapping(index) {
    tapping = index;
    update();
  }

  @override
  goToAddUserPage() {
    Get.toNamed(AppRoutes.addUserPge);
  }

  @override
  goToChatRoom(name, chatroomId) {
    Get.toNamed(AppRoutes.chatPage, arguments: {
      "name": name,
      "chatRoom_id": chatroomId,
    });
  }

  @override
  search(String query) {
    searc = query;
  }

  @override
  pickedVideo() async {
    final picedVideo = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (picedVideo != null) {
      File file = File(picedVideo.path);
      String fileName = picedVideo.name;

      Reference storageRef =
          FirebaseStorage.instance.ref().child('files/$fileName');

      await storageRef.putFile(file);
      String downloadUrl = await storageRef.getDownloadURL();
      String user_email = appService.sharedPreferences.getString("user_email")!;
      chatRoomsData.addStoryVideo(downloadUrl, user_email);
    }
  }

  @override
  pickedImage() async {
    final picedImage = await imagePicker.pickMedia();
    if (picedImage != null) {
      File file = File(picedImage.path);
      String fileName = picedImage.name;
      Reference storageRef =
          FirebaseStorage.instance.ref().child('files/$fileName');
      await storageRef.putFile(file);
      String downloadUrl = await storageRef.getDownloadURL();
      String user_email = appService.sharedPreferences.getString("user_email")!;
      chatRoomsData.addStoryImage(downloadUrl, user_email);
    }
  }

  @override
  void getStory(userList) {
    // stasusrecuest = Stasusrecuest.loading;
    update();
    String email = appService.sharedPreferences.getString("user_email")!;

    chatRoomsData.getStory(userList, email).listen((querySnapshot) {
      storys.value = querySnapshot.docs;
      stasusrecuest = Stasusrecuest.success;
      update();
    });
  }

  @override
  getMyUsers() async {
    stasusrecuest = Stasusrecuest.loading;
    update();
    String userid = appService.sharedPreferences.getString("user_uid")!;
    chatRoomsData.getMyUsers(userid).listen((querySnapshot) {
      myUsers.value =
          querySnapshot.docs.map((doc) => doc["email"] as String).toList();


      getStory(myUsers);
      stasusrecuest = Stasusrecuest.success;
      update();
    });
  }

  @override
  void getChatRooms() {
    String userEmail = appService.sharedPreferences.getString("user_email")!;
    stasusrecuest = Stasusrecuest.loading;
    update();
    chatRoomsData.getChatrooms(userEmail).listen((querySnapshot) {
      rooms.value = querySnapshot.docs;
      stasusrecuest = Stasusrecuest.success;
      update();
    });
  }

  @override
  addUserToMyUsers(user_uid, user_email, name) {
    chatRoomsData.addUserToMyUsers(user_uid, user_email);
  }

  @override
  updateuserAddedData(id) {
    chatRoomsData.updateuserAddedData(id);
  }

  @override
  goToVideoView(String media) {
    Get.toNamed(AppRoutes.viewVideoPage, arguments: {
      "message": media,
    });
  }

  @override
  goToImageView(String media) {
    Get.toNamed(AppRoutes.viweImagePage, arguments: {
      "message": media,
    });
  }

  @override
  requestPermission() async {
 await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  @override
  deleteChatRoom(chatRoomId) {
    chatRoomsData.delteeChtaRoom(chatRoomId);
  }

  @override
  init_style() {
    AppColor.bg_brand_soli = Color(
        appService.sharedPreferences.getDouble("style") != null
            ? appService.sharedPreferences.getDouble("style")!.toInt()
            : 0xFF444CE7);
  }


  @override
  updateUserStats() {

  }
  @override
  void onInit() async {
    init_style();
    requestPermission();
    getChatRooms();
    getMyUsers();
    super.onInit();
  }
  

}
