import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../dataforcrud/models/chatmodel.dart';
import '../../../core/services/cache_storage_services.dart';

class ChatController extends GetxController {

  final _messagesController = StreamController<List<MessageModel>>();

  Stream<List<MessageModel>> get messagesStream => _messagesController.stream;
  TextEditingController ? chatController ;

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

  @override
  void onInit() {
chatController =TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _messagesController.close();
    super.dispose();
  }

}