// import 'package:get/get.dart';
// import 'package:rating_dialog/rating_dialog.dart';
// import 'package:flutter/material.dart';
//
// import '../../controllers/mytrips.dart';
//
//
//
// // show the dialog
// void showDialogRating(BuildContext context,id){
//   showDialog(
//     context: context,
//     barrierDismissible: true,
//     // set to false if you want to force a rating
//     builder: (context) => RatingDialog(
//       initialRating: 1.0,
//       // your app's name?
//       title: Text(
//
//         "تقييم السائق",
//
//         textAlign: TextAlign.center,
//
//         style: const TextStyle(
//
//           fontSize: 25,
//
//           fontWeight: FontWeight.bold,
//
//         ),
//
//       ),
//
//       // encourage your user to leave a high rating?
//
//       message: Text(
//
//         "قيم السائق ضعيف جيد سئ ",
//
//         textAlign: TextAlign.center,
//
//         style: const TextStyle(fontSize: 15),
//
//       ),
//
//       // your app's logo?
//
//       image: Image.asset("assets/car.png",height: 60,),
//
//       submitButtonText: "ارسال",
//
//       commentHint: "التقييم",
//
//       onCancelled: () => print('cancelled'),
//
//       onSubmitted: (response) {
//         MyTripsController controller = Get.find();
//         controller.rateTrip(id, response.comment);
//
//       },
//
//     ),
//   );
// }
