class MyTripsModel {
  PickupLocation? pickupLocation;
  String? sId;
  String? passenger;
  String? driver;
  PickupLocation? destinationLocation;
  String? status;
  int? fare;
  String? date;

  MyTripsModel(
      {this.pickupLocation,
        this.sId,
        this.passenger,
        this.driver,
        this.destinationLocation,
        this.status,
        this.fare,
        this.date});

  MyTripsModel.fromJson(Map<String, dynamic> json) {
    pickupLocation = json['pickupLocation'] != null
        ? new PickupLocation.fromJson(json['pickupLocation'])
        : null;
    sId = json['_id'];
    passenger = json['passenger'];
    driver = json['driver'];
    destinationLocation = json['destinationLocation'] != null
        ? new PickupLocation.fromJson(json['destinationLocation'])
        : null;
    status = json['status'];
    fare = json['fare'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pickupLocation != null) {
      data['pickupLocation'] = this.pickupLocation!.toJson();
    }
    data['_id'] = this.sId;
    data['passenger'] = this.passenger;
    data['driver'] = this.driver;
    if (this.destinationLocation != null) {
      data['destinationLocation'] = this.destinationLocation!.toJson();
    }
    data['status'] = this.status;
    data['fare'] = this.fare;
    data['date'] = this.date;
    return data;
  }
}

class PickupLocation {
  String? type;
  List<double>? coordinates;

  PickupLocation({this.type, this.coordinates});

  PickupLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}