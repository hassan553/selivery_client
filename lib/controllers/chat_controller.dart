import 'package:get/get.dart';
import 'dart:async';
import '../models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatController extends GetxController {
  final _messagesController = StreamController<List<MessageModel>>();

  Stream<List<MessageModel>> get messagesStream => _messagesController.stream;

  List<MessageModel> _messages = [];

  StreamSubscription<QuerySnapshot>? _subscription;

  void getMessages(String receiverId) {
    final collection = FirebaseFirestore.instance
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime');

    _subscription = collection.snapshots().listen((snapshot) {
      _messages = snapshot.docs.reversed.map((doc) {
        final result = MessageModel.fromJson(doc.data());
        return result;
      }).toList();

      _messagesController.add(_messages);
    });
  }

  Future sendMessage(MessageModel model) async {
    await _sendMessage(model, true);
    await _sendMessage(model, false);
  }

  _sendMessage(MessageModel model, bool isSender) async {
    String id = isSender ? model.senderId : model.receiverId;
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(id)
        .collection('messages')
        .add(model.toJson());
        print('done send message');
  }

  void dispose() {
    _subscription?.cancel();
    _messagesController.close();
  }
}
