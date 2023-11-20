import 'package:firebase_messaging/firebase_messaging.dart';

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
  static Future<String?> getDeviceTok() async {
    try {
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
}
