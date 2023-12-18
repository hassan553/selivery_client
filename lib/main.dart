import 'package:flutter/material.dart';
import 'package:selivery_client/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:selivery_client/firebase_options.dart';
import 'core/functions/location.dart';
import 'core/helper/notifictions_helper.dart';
import 'core/services/cache_storage_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheStorageServices.init();
  requestPermissionLocation();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String ? tok = await FirebaseMessagingService.getDeviceToken();
  print("device token ${tok}");
  runApp(const SeliveryClient());
}
