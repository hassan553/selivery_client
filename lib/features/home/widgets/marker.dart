
import 'package:flutter/material.dart';

import '../../../dataforcrud/models/custommarker.dart';

class CustomMarkerWidget extends StatelessWidget {
  final CustomMarker marker;

  CustomMarkerWidget({required this.marker});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundImage: AssetImage(marker.userImage),
        ),
        ElevatedButton(
          onPressed: marker.onButtonPressed,
          child: Text('Click me'),
        ),
      ],
    );
  }
}
