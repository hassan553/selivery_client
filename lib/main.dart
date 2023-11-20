import 'package:flutter/material.dart';

import 'core/services/cache_storage_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheStorageServices.init();
  runApp(const MyApp());
}
