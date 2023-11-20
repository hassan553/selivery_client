class OwnerModel {
  Rating? rating;
  String? sId;
  String? name;
  String? gender;
  int? age;
  String? email;
  bool? verified;
  String? image;
  int? status;
  bool? available;

  OwnerModel(
      {this.rating,
        this.sId,
        this.name,
        this.gender,
        this.age,
        this.email,
        this.verified,
        this.image,
        this.status,
        this.available});

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
    status = json['status'];
    available = json['available'];
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
    data['status'] = this.status;
    data['available'] = this.available;
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