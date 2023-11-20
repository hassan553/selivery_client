import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../rental/presentation/views/rental_view.dart';
import '../views/home_view.dart';

class HomeController extends GetxController {
  int bottomNavigationCurrentIndex = 0;

  List<Widget> screens = const [HomeView(), RentalView(), HomeView(), HomeView()];
  void changeBottomNavigationCurrentIndex(int index) {
    bottomNavigationCurrentIndex = index;
    update();
  }
}
