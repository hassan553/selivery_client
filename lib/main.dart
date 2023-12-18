import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selivery_client/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:selivery_client/firebase_options.dart';
<<<<<<< HEAD
import 'core/functions/location.dart';
import 'core/helper/notifictions_helper.dart';
=======
>>>>>>> e75399400b10bf81a5d06800a8e1111972736177
import 'core/services/cache_storage_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheStorageServices.init();
<<<<<<< HEAD
  requestPermissionLocation();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String ? tok = await FirebaseMessagingService.getDeviceToken();
  print("device token ${tok}");
=======
  setupOrientation();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
>>>>>>> e75399400b10bf81a5d06800a8e1111972736177
  runApp(const SeliveryClient());
}

void setupOrientation() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
