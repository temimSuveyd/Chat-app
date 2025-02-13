class ChatMessage {
  final String redirectionMessage;
  final String messageType;
  final String message;
  final String sender;
  final String message_id;
  final String date;
  final String emoji;
  final bool isFavorite;
  final bool isPlaying;
  final bool redirectiond;
  final bool stats;

  ChatMessage({
    required this.messageType,
    required this.message,
    required this.sender,
    required this.date,
    required this.isFavorite,
    required this.isPlaying,
    required this.redirectionMessage,
    required this.redirectiond,
    required this.stats,
    required this.message_id,
    required this.emoji
  });

  factory ChatMessage.fromJson(
      Map<String, dynamic> json, message_id) {
    return ChatMessage(
      emoji:json["emoji"]  ?? "",
      message_id: message_id ?? '',
      messageType: json["message_type"] ?? '',
      message: json["message"] ?? '',
      sender: json["sender"] ?? '',
      date: json["add_time"] ?? '',
      isFavorite: json["isFavorite"] ?? false,
      isPlaying: json["isPlaying"] ?? false,
      redirectionMessage: json["redirectiondMessage"] ?? "",
      redirectiond: json["redirectiond"],
      stats: json["stats"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "emoji":emoji,
      "message_id": message_id,
      "message_type": messageType,
      "message": message,
      "sender": sender,
      "date ": date,
      "isFavorite": isFavorite,
      "isPlaying": isPlaying,
      "redirectionMessage": redirectionMessage,
      "redirectiond": redirectiond,
      "stats": stats,
    };
  }
}
