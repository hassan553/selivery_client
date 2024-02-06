class MyTripsModel {
  PickupLocation? pickupLocation;
  String? sId;
  Passenger? passenger;
  Driver? driver;
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
    passenger = json['passenger'] != null
        ? new Passenger.fromJson(json['passenger'])
        : null;
    driver =
    json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
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
    if (this.passenger != null) {
      data['passenger'] = this.passenger!.toJson();
    }
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
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

class Passenger {
  String? sId;
  String? name;
  String? gender;
  int? age;
  String? email;
  bool? verified;
  String? password;
  String? image;
  String? role;
  bool? available;
  String? deviceToken;
  int? iV;

  Passenger(
      {this.sId,
        this.name,
        this.gender,
        this.age,
        this.email,
        this.verified,
        this.password,
        this.image,
        this.role,
        this.available,
        this.deviceToken,
        this.iV});

  Passenger.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    age = json['age'];
    email = json['email'];
    verified = json['verified'];
    password = json['password'];
    image = json['image'];
    role = json['role'];
    available = json['available'];
    deviceToken = json['deviceToken'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['email'] = this.email;
    data['verified'] = this.verified;
    data['password'] = this.password;
    data['image'] = this.image;
    data['role'] = this.role;
    data['available'] = this.available;
    data['deviceToken'] = this.deviceToken;
    data['__v'] = this.iV;
    return data;
  }
}

class Driver {
  Rating? rating;
  String? sId;
  String? name;
  String? gender;
  int? age;
  String? email;
  bool? verified;
  String? password;
  String? image;
  String? phone;
  int? status;
  bool? available;
  String? subscriptionExpiry;
  String? deviceToken;
  int? iV;
  Vehicle? vehicle;

  Driver(
      {this.rating,
        this.sId,
        this.name,
        this.gender,
        this.age,
        this.email,
        this.verified,
        this.password,
        this.image,
        this.phone,
        this.status,
        this.available,
        this.subscriptionExpiry,
        this.deviceToken,
        this.iV,
        this.vehicle});

  Driver.fromJson(Map<String, dynamic> json) {
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    age = json['age'];
    email = json['email'];
    verified = json['verified'];
    password = json['password'];
    image = json['image'];
    phone = json['phone'];
    status = json['status'];
    available = json['available'];
    subscriptionExpiry = json['subscription_expiry'];
    deviceToken = json['deviceToken'];
    iV = json['__v'];
    vehicle =
    json['vehicle'] != null ? new Vehicle.fromJson(json['vehicle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['email'] = this.email;
    data['verified'] = this.verified;
    data['password'] = this.password;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['available'] = this.available;
    data['subscription_expiry'] = this.subscriptionExpiry;
    data['deviceToken'] = this.deviceToken;
    data['__v'] = this.iV;
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle!.toJson();
    }
    return data;
  }
}

class Rating {
  int? cool;
  int? good;
  int? fair;

  Rating({this.cool, this.good, this.fair});

  Rating.fromJson(Map<String, dynamic> json) {
    cool = json['cool'];
    good = json['good'];
    fair = json['fair'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cool'] = this.cool;
    data['good'] = this.good;
    data['fair'] = this.fair;
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