class DriversModel {
  Driver? driver;
  Location? location;

  DriversModel({this.driver, this.location});

  DriversModel.fromJson(Map<String, dynamic> json) {
    driver =
    json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Driver {
  String? sId;
  String? name;
  String? image;
  String? phone;
  Vehicle? vehicle;

  Driver({this.sId, this.name, this.image, this.phone, this.vehicle});

  Driver.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    vehicle =
    json['vehicle'] != null ? new Vehicle.fromJson(json['vehicle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['phone'] = this.phone;
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle!.toJson();
    }
    return data;
  }
}

class Vehicle {
  String? category;
  List<String>? images;
  String? model;
  String? sId;

  Vehicle({this.category, this.images, this.model, this.sId});

  Vehicle.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    images = json['images'].cast<String>();
    model = json['model'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['images'] = this.images;
    data['model'] = this.model;
    data['_id'] = this.sId;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}