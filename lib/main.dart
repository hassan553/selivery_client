import 'package:flutter/material.dart';
import 'package:selivery_client/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/cache_storage_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheStorageServices.init();
  await Firebase.initializeApp();
  runApp(const SeliveryClient());
}
