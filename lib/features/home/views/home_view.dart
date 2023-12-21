import 'package:flutter/material.dart';
import 'advises.dart';
import 'rental_sale_car_view/order_car_view.dart';
import '../../../core/rescourcs/app_colors.dart';
import '../../../core/widgets/custom_appBar.dart';
import '../widgets/category_items.dart';
import 'order_car_view/category_get_location_from_user_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: customAppBarForSearch(context),
      body: ListView(
        children: const [
          SizedBox(height: 10),
          CategoryItem(
            imagePath: 'assets/orderCar.png',
            title: 'طلب مركبة',
            isRental: false,
            screen:AdvisesScreen(),
          ),
          CategoryItem(
            imagePath: 'assets/rentalCar.png',
            title: 'تأجير مركبة',
            isRental: true,
            screen: OrderCarView(
              isRental: true,
            ),
          ),
          CategoryItem(
            imagePath: 'assets/buyCar.png',
            title: 'شراء مركبة',
            isRental: false,
            screen: OrderCarView(
              isRental: false,
            ),
          ),
        ],
      ),
    );
  }
}
