class OwnerModel {
  Rating? rating;
  String? sId;
  String? name;
  String? gender;
  int? age;
  String? email;
  bool? verified;
  String? image;
  String? phone;
  int? status;
  bool? available;
  String? subscriptionExpiry;
  String? deviceToken;
  Vehicle? vehicle;

  OwnerModel(
      {this.rating,
        this.sId,
        this.name,
        this.gender,
        this.age,
        this.email,
        this.verified,
        this.image,
        this.phone,
        this.status,
        this.available,
        this.subscriptionExpiry,
        this.deviceToken,
        this.vehicle});

  OwnerModel.fromJson(Map<String, dynamic> json) {
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    age = json['age'];
    email = json['email'];
    verified = json['verified'];
    image = json['image'];
    phone = json['phone'];
    status = json['status'];
    available = json['available'];
    subscriptionExpiry = json['subscription_expiry'];
    deviceToken = json['deviceToken'];
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
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['available'] = this.available;
    data['subscription_expiry'] = this.subscriptionExpiry;
    data['deviceToken'] = this.deviceToken;
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