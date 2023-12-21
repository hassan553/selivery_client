import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker {
  final String id;
  final LatLng position;
  final String userName;
  final String userImage;
  final void Function() onButtonPressed;

  CustomMarker({
    required this.id,
    required this.position,
    required this.userName,
    required this.userImage,
    required this.onButtonPressed,
  });
}