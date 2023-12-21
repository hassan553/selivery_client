class DriverModel {
  String id;
  String name;
  String image;
  String phone;
  double latitude;
  double longitude;

  DriverModel({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.latitude,
    required this.longitude,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['driver']['_id'],
      name: json['driver']['name'],
      image: json['driver']['image'],
      phone: json['driver']['phone'],
      latitude: json['location']['latitude'],
      longitude: json['location']['longitude'],
    );
  }
}
