import 'dart:convert';

import 'package:http/http.dart' as http;
snedNotification(
    String bodyText, String title, String token, String authorization) async {
  var headersList = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $authorization'
  };
  var url = Uri.parse(
      'https://fcm.googleapis.com/v1/projects/chat-app-b44e9/messages:send');

  var body = {
    "message": {
      "token": token,
      "notification": {
        "title": title,
        "body": bodyText,
      },
    }
  };

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);
  var res = await req.send();


  if (res.statusCode >= 200 && res.statusCode < 300) {
  } else {
  }
}