import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../controllers/mytripcontroller.dart';
import '../../controllers/mytrips.dart';
import 'package:get/get.dart';

class RatingScreen extends StatefulWidget {
  final String id;
  const RatingScreen({super.key, required this.id});
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 1.0;
  String _selectedText = "good";
  // Default text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تقييم السائق"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("assets/car.png",height: 80,),
            ),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 3,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                  _selectedText = getRatingText(_rating);
                });
              },
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("جيد", style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("متوسط", style: TextStyle(fontSize: 16)),
                ),
                Text("رائع", style: TextStyle(fontSize: 16)),
              ],
            ),
            Text(
              "Selected Text: $_selectedText",
              style: TextStyle(fontSize: 18,color: Colors.green),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("ok");
                // Call your API here with the selected text
                MyTripController controller = Get.find();
                controller.rateTrip(widget.id,_selectedText);
                print("Submitting rating with text jj: $_selectedText");
                // Add your API call logic here
                // Example: _submitRating(_selectedText);
              },
              child: Text("تقييم",style: TextStyle(fontSize: 30),),
            ),
          ],
        ),
      ),
    );
  }

  String getRatingText(double rating) {
    if (rating == 1.0) {
      return "good";
    } else if (rating == 2.0) {
      return "fair";
    } else if (rating == 3.0) {
      return "cool";
    } else {
      return "";
    }
  }

//Add your API submission logic here
void _submitRating(String selectedText,id) {
  // Call your API here with the selected text

  print("Submitting rating with text: $selectedText");
}
}

