import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:chat_app/core/class/stasusRecuest.dart';
import 'package:chat_app/core/constanst/routes.dart';
import 'package:chat_app/core/function/SendNotification.dart';
import 'package:chat_app/core/function/save_video_togalery.dart';
import 'package:chat_app/core/services/AppService.dart';
import 'package:chat_app/data/datascore/remote/homeData.dart';
import 'package:chat_app/data/datascore/remote/messagesData.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

import '../core/function/save_image_to_gallery.dart';

abstract class ChatController extends GetxController {
  init();
  getMessage();
  sendMessage();
  changeSendButton();
  startRecord();
  stopRecord();
  pickedImage();
  goToimageView(String mesage, String type);
  pickedVideo();
  gotoVideoView(String video);
  getThumbnail(String videoPath);
  updateMessage(String last_msg);
  delete_message(String message_id);
  share_message(String message_id, String message);
  copy_message(String message_id, String message);
  push_message(String message_id);
  saveMedyaTogalery(String message_id, String message, String medyaType);
  getChatRoomData();
  getAccessToken();
  playeVoise(String url);
  stopVoise();
  voiseStats(bool stats, String message_id);
  deleteChat();
  redirection(String title, String selected_messageType);
  redirectionCanel();
  messageSelected(bool is_selected);
  addEmoji(String emoji, String room_id, String message_id);
  updateUserStats(bool stats);
  showOptions(
      bool is_selected, String message_id, String message, String messageType);
  hidenOptions();
  slideChatBox();
  changeIndex(int index);
  sendNotifaction(String title);
}

class ChatControllerImp extends ChatController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  String? name;
  String? from_name;
  String? chatRoom_id;
  String? email;
  String? token;
  String? avatar;
  String? accessToken;
  String? user_uid;
  String? message_id;
  String? message;
  String? messageType;

  late TextEditingController textController;
  late Stasusrecuest stasusrecuest;
  var messagesList = [].obs;
  var chatData;
  ScrollController scrollController = ScrollController();
  AppService appService = Get.find();
  MessagesData messagesData = MessagesData();
  ChatRoomsData chatRoomsData = ChatRoomsData();

  AudioPlayer audioPlayer = AudioPlayer();
  final record = AudioRecorder();
  final image_picker = ImagePicker();
  String path = "";
  String url = "";
  String video_image = "";
  String redirection_massege = "";
  bool messageStatus = false;
  bool isRecord = false;
  bool is_player = false;
  bool change = false;
  bool redirection_massege_sts = false;
  bool message_selected = false;
  bool show_options = false;
  bool? user_stats;
  RxBool from_call = false.obs;
  RxBool to_call = false.obs;
  double padding = 16;
  int select_index = 0;
  int index = 0;

  @override
  init() {
    chatRoom_id = Get.arguments["chatRoom_id"];
    name = Get.arguments["name"];
    user_uid = appService.sharedPreferences.getString("user_uid")!;
  }

  @override
  sendMessage() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      String fromEmail = appService.sharedPreferences.getString("user_email")!;
      if (redirection_massege_sts == false) {
        messagesData.addMessage(
            chatRoom_id!, textController.text, fromEmail, "", "");
        updateMessage(textController.text);
        sendNotifaction(textController.text);
        textController.clear();
      } else {
        messagesData.addRedirectiondMessage(chatRoom_id!, textController.text,
            fromEmail, redirection_massege, "",messageType!);
        updateMessage(" redirected ${textController.text}");
        sendNotifaction(textController.text);
        redirectionCanel();
        textController.clear();
      }
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
      update();
    }
  }

  @override
  void getMessage() {
    stasusrecuest = Stasusrecuest.loading;
    update();
    messagesData.getMessage(chatRoom_id!).listen((querySnapshot) {
      messagesList.value = querySnapshot.docs;
      Future.delayed(Duration(milliseconds: 10), () {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      });
      stasusrecuest = Stasusrecuest.success;
      update();
    });
  }

  @override
  changeSendButton() async {
    if (change == true) {
      change = false;
      update();
    } else {
      stopRecord();
      change = true;
      update();
    }
  }

  @override
  startRecord() async {
    isRecord = true;

    update();
    final location = await getApplicationDocumentsDirectory();
    final String name = const Uuid().v1();
    if (await record.hasPermission()) {
      await record.start(const RecordConfig(),
          path: location.path + name + ".m4a");
    } else {}

    update();
  }

  @override
  stopRecord() async {
    isRecord = false;

    update();
    String user_email = appService.sharedPreferences.getString("user_email")!;

    String? final_path = await record.stop();
    path = final_path!;
    File file = File(path);
    String name = basename(path);
    Reference storageRef = FirebaseStorage.instance.ref().child('voise/$name');
    await storageRef.putFile(file);
    String downloadUrl = await storageRef.getDownloadURL();
    messagesData.addVoise(chatRoom_id!, downloadUrl, user_email);
    sendNotifaction("Voise 🎙️");
    update();
  }

  @override
  pickedImage() async {
    messageStatus = true;
    update();
    final picedImage =
        await image_picker.pickImage(source: ImageSource.gallery);
    if (picedImage != null) {
      File file = File(picedImage.path);
      String fileName = picedImage.name;
      Reference storageRef =
          FirebaseStorage.instance.ref().child('files/$fileName');
      await storageRef.putFile(file);
      String downloadUrl = await storageRef.getDownloadURL();
      String user_email = appService.sharedPreferences.getString("user_email")!;
      messagesData.addImage(chatRoom_id!, downloadUrl, user_email);
      updateMessage("Photo 📷");
      sendNotifaction("Photo 📷");
      snedNotification("Photo 📷", name!, token!, accessToken!);
      messageStatus = false;
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
      update();
    }
  }

  @override
  goToimageView(mesage, type) {
    if (type == "image") {
      Get.toNamed(AppRoutes.viweImagePage, arguments: {
        "message": mesage,
      });
    } else {
      Get.toNamed(AppRoutes.viewVideoPage, arguments: {
        "message": mesage,
      });
    }
  }

  @override
  pickedVideo() async {
    messageStatus = true;
    update();
    final picedVideo =
        await image_picker.pickVideo(source: ImageSource.gallery);
    if (picedVideo != null) {
      File file = File(picedVideo.path);
      String fileName = picedVideo.name;

      Reference storageRef =
          FirebaseStorage.instance.ref().child('files/$fileName');

      await storageRef.putFile(file);

      String downloadUrl = await storageRef.getDownloadURL();
      String user_email = appService.sharedPreferences.getString("user_email")!;

      // await getThumbnail(downloadUrl);
      messagesData.addvideo(chatRoom_id!, downloadUrl, user_email, video_image);
      updateMessage("Video 📽️");
      sendNotifaction("Video 📽️");
      snedNotification("Video 📽️", name!, token!, accessToken!);
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
      messageStatus = false;
      update();
    }
  }

  @override
  gotoVideoView(video) {
    Get.toNamed(AppRoutes.viewVideoPage, arguments: {"media": video});
  }

  @override
  Future getThumbnail(videoPath) async {}
  @override
  updateMessage(last_msg) {
    messagesData.updateLastmessage(last_msg, chatRoom_id!);
  }

  @override
  delete_message(message_id) {
    messagesData.delete_message(chatRoom_id!, message_id);
    show_options = false;
    Get.rawSnackbar(
      message: "message deleted",
    );
    update();
  }

  @override
  copy_message(String message_id, String message) async {
    Clipboard.setData(ClipboardData(text: message)).then((_) {});
    show_options = false;
    Get.rawSnackbar(
      message: "message Copied",
    );
    update();
  }

  @override
  push_message(String message_id) {}

  @override
  share_message(String message_id, String message) {
    Share.share(message);
    show_options = false;
    Get.rawSnackbar(
      message: "Message shared",
    );
    update();
  }

  @override
  saveMedyaTogalery(String message_id, String message, String medyaType) async {
    if (medyaType == "video") {
      await saveVdieoToGallery(message);
      Get.rawSnackbar(
        message: "video saved",
      );
    } else if (medyaType == "image") {
      await saveImageToGallery(message);
      Get.rawSnackbar(
        message: "image saved",
      );
    }

    show_options = false;

    update();
  }

  @override
  getChatRoomData() {
    stasusrecuest = Stasusrecuest.loading;
    update();
    String user_email = appService.sharedPreferences.getString("user_email")!;
    messagesData.getChatRoomData(chatRoom_id!).listen((querySnapshot) {
      chatData = querySnapshot.data();
      from_call.value = chatData!["from_call_stats"];
      to_call.value = chatData!["to_call_stats"];
      if (user_email == chatData!["from_email"]) {
        token = chatData!["to_token"];
        avatar = chatData!["to_avatar"];
        name = chatData!["to_name"];
        user_stats = chatData!["to_stats"];
        from_name = chatData!["from_name"];
      } else {
        token = chatData!["from_token"];
        avatar = chatData!["from_avatar"];
        from_name = chatData!["from_name"];
        user_stats = chatData!["from_stats"];
      }
    });
    stasusrecuest = Stasusrecuest.success;
    update();
  }

  @override
  getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "chat-app-b44e9",
      "private_key_id": "6bed1eef373a184937468979db58bef40315f1c8",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDejFLkJjpFXEGG\n5Qa0CuaD4Vo/I0vbwVN++PNv5Jc0ovzxUxSU+bHwW8Nd9uc8WF3ShWxhL09+OMwu\nyDYzZrZ/VJSGq+RF8ft/ZJyuh5b8AecNEa9DJS3Z2YVk1diEo7hCWRItZvM0uUis\nS8zD/D9aXuMucAfnmcmcw83+bthvQPinOzVdGnGldWPcLsfoJkT+5oyv3tL7uQz+\nyrrPCLyybkKsfspm8rbXcEe3gyHwXhA1vcNFFzd6CUfUr1wiW+SZYOlQ951fBK3+\ni/JgjyujInhKhgF/ITmiRCB4FaDX2t2xV4zsv4ariAF/YuX47NG4nZb9pPE5Xp2G\nqNjQ2ojHAgMBAAECggEAEYoDmmF85CyCKYxxO81EH46qGyG//8C7wN0D6oScehSC\nVM6UZ61KHcRNoGEuFi5sroO/Z+VfoXX+eY1j4CcvKNfUoMx5QB3zETYvtv2Oo6vO\nttP2+Ra8B1hCUBEecE2q3ufAK/3aGwSjOpj6uVNu9sNVqjpAFTukjQtNd8jqm9Hg\nT/BJI7dBf+bRptIPmhoqn9HjTQHPso+wGS75d8+t0dOfvW0N+mu6T1s0hpha8Fms\no5FDkjnwRaIMzinOfICxUeToT7aHwZL1NMMyDrhfoair4fIrkiK/Hx/UWVhuOhIR\ni14WcRWY21OV315yO624cGwHJAGzzuT4AcghdaoZEQKBgQD/8/ROT7aPvw3sqD5l\nJ4B1kfVPdaiXAod8+c1DyUZ8poFSpYOiwRHci9yC5r2CWwS0k3tMLZNS40hbq6c6\nFZ36BuwuPh5b9U4/MOe7MS6RChAPcNIvbQ7ZNbv8qYrQvcjvmNw6yZl5gvlBly7w\nYUKi4SoIhUvOk7llLFqnE3HtnwKBgQDelswgshKvb4hytdyJ/9qPcEmOkVco32ap\ns0E8mMJqy6sJ2QuKZ/yr8sgqCS6fsnZnOEu6FB6bs293bPRGailuIuzD9ub2K0aT\nsWtfyE/IvaKqJUkVNxSk1EW/7QkGZkkQkiGFCAj1xJB5enOepnygomT06v+U6bVV\nXDtMXbjD2QKBgQDILcwM01s84XfKd2sVQee+DAGHu8W3FUtR+y0GrwxpwO+z668g\nQ0/s5ZX46u2cXgM4F4B++8YVNZ0J1R5c1ztOqMte/0ZPNXOVCHK0fKqm1O/qo5o/\nbVQHnXcBDLh8uXHFsg/MCo/18PFw0wTrC6ZKLT/qmhXH4tFEx4O+1/5qkQKBgEV4\nPwE9UoOahbV3ePtA9Q+rdemfBtrkzn/MSGIHMzZtllYefXGW/s8TmNE1yG1jH30b\nntbWjK7/k5xsTtjjLUcIc2i92FugKgjSaLaeJ/h45xm/RU3vwOuorJQ4AIcUyVz4\nnqmMVm+OB6FCTG+JeoAP7v5ZkacCQewAOymcXpwRAoGBALIFwYgpZnvzfS2mGi6D\nl7flvXE/9skkzELhyHvAGyyoxCQbbO4r771nFzHQrx05zfvaEM5+JW0Y/IuRNAFo\nKpLuSib7yyYESQ3KkQKhmDCQdYQFD9e5/jJx+SCz678nEgm1JAa14gY1hhcuIRI4\ni//6PHMZ2ySxFPrASFVkaSnX\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-26iha@chat-app-b44e9.iam.gserviceaccount.com",
      "client_id": "100374641709166566359",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-26iha%40chat-app-b44e9.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

      auth.AccessCredentials credentials =
          await auth.obtainAccessCredentialsViaServiceAccount(
              auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
              scopes,
              client);
      client.close();
      accessToken = credentials.accessToken.data;
    } catch (e) {}
  }

  @override
  playeVoise(url) async {
    is_player = true;
    update();

    await audioPlayer.play(UrlSource(url));
    update();
  }

  @override
  stopVoise() {
    audioPlayer.stop();
    is_player = false;
    update();
  }

  @override
  voiseStats(bool stats, String message_id) {
    messagesData.voiseStats(chatRoom_id!, stats, message_id);
  }

  @override
  deleteChat() {
    messagesData.delete_chat(chatRoom_id!);
  }

  @override
  redirection(String title, String selected_messageType) {
    messageType = selected_messageType;
    if (redirection_massege_sts == true) {
      redirection_massege_sts = false;
      update();
    } else {
      redirection_massege_sts = true;
      update();
    }
    redirection_massege = title;
    update();
  }

  @override
  redirectionCanel() {
    redirection_massege_sts = false;
    padding = 16;
    update();
  }

  @override
  messageSelected(is_selected) {
    message_selected = is_selected;
    update();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  addEmoji(emoji, room_id, message_id) {
    messagesData.addEmoji(room_id, message_id, emoji);
    update();
  }

  @override
  updateUserStats(stats) {
    WidgetsBinding.instance.addObserver(AppLifecycleListener(
      onResume: () {},
    ));
    String email = appService.sharedPreferences.getString("user_email")!;
    if (email == chatData!["from_email"]) {
      chatRoomsData.changeFrom_UserStats(chatRoom_id!, stats);
      update();
    } else {
      chatRoomsData.changeTo_UserStats(chatRoom_id!, stats);
      update();
    }
  }

  @override
  showOptions(is_selected, selected_message_id, selected_message,
      selected_messageType) {
    message_id = selected_message_id;
    message = selected_message;
    messageType = selected_messageType;

    show_options = true;
    update();
  }

  @override
  hidenOptions() {
    show_options = false;
    update();
  }

  @override
  slideChatBox() {
    padding = 60;
    update();
  }

  @override
  changeIndex(int index) {
    select_index = index;
    update();
  }

  @override
  sendNotifaction(String title) {
    snedNotification(title, name!, token!, accessToken!);
  }

  @override
  void onInit() {
    textController = TextEditingController();
    init();
    getAccessToken();
    getChatRoomData();
    getMessage();
    super.onInit();
  }
}
