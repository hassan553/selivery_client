
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class FirebaseMessagingService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  // Initialize Firebase Messaging and request permission
  static Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();
    configureForegroundMessaging();
    firebaseNotificationHandler();
    subscribeToTopic('advertisement');
  }

  // Get the device token for push notifications
  static Future<String?> getDeviceToken() async {
    try {
      print(await _firebaseMessaging.getToken());
      return await _firebaseMessaging.getToken();
    } catch (error) {
      return null;
    }
  }

  // Configure callback for handling incoming messages when the app is in the foreground
  static void configureForegroundMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        // Handle notification message
        final notification = message.notification!;
        // Extract notification details
        final title = notification.title ?? '';
        final body = notification.body ?? '';
        Get.snackbar("$title","$body");
        print(title);
        print(body);
      }
    });
  }

  static Future<void> backgroundHandler(RemoteMessage message) async {
    // Handle notification message
    final notification = message.notification!;
    // Extract notification details
    final title = notification.title ?? '';
    final body = notification.body ?? '';
    print(title);
    print(body);
  }

  // Subscribe to a topic
  static Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  // Unsubscribe from a topic
  static Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  static firebaseNotificationHandler() {
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        _handleNotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
      if (message != null) {
        _handleNotification(message);

      }
    });
  }

  static void _handleNotification(RemoteMessage message) {
    final notification = message.notification;
    final data = message.data;
    print(' i click on message');
  }
  
  static Future sendNotification(
      {required String title,
      required String body,
      required String userToken}) async {
    const String serverKey =
        'AAAAc_PLxMg:APA91bEDAc_I4jG2wzGgRCq6drkNzO-JlvyA91MzGABJrRx6Kix_uKreTGAF34AaLAxvQ8Nz1XGeWTwgNutQpccQzYcelYpRyqply0PITDPjIMugIuaqk_-uK4Ar0Q_TvSjNQoEW_7fA'; // Replace with your server key
    const String fcmEndpoint = 'https://fcm.googleapis.com/fcm/send';

    final Map<String, dynamic> notificationData = {
      'notification': {
        'title': title,
        'body': body,
      },
      'to': userToken,
    };

    final http.Response response = await http.post(
      Uri.parse(fcmEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverKey',
      },
      body: jsonEncode(notificationData),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }
}
