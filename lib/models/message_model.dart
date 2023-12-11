class MessageModel {
  final String receiverId;
  final String senderId;
  final String dateTime;
  final String message;

  MessageModel({
    required this.receiverId,
    required this.senderId,
    required this.dateTime,
    required this.message,
  });
  factory MessageModel.fromJson(dynamic json) {
    return MessageModel(
        message: json['message'],
        dateTime: json['dateTime'],
        senderId: json['senderId'],
        receiverId: json['receiverId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'message': message,
      'dateTime': dateTime,
      'receiverId': receiverId,
    };
  }
}
