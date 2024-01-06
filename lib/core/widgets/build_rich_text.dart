import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final Color color;
  final String imagePath;
  const CustomRichText(
      {super.key, required this.imagePath, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            text: 'Se',
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Livery',
                style: TextStyle(
                  fontSize: 28,
                  color: color,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        CircleAvatar(
          backgroundColor: Colors.blue.shade200,
          radius: 25,
          backgroundImage: AssetImage(imagePath),
        ),
      ],
    );
  }
}
