class carListModel {
  String? userId;
  String? ownerName;
  String? phone;
  String? facebookLink;
  String? telegramLink;
  Car? car;
  int? price;
  String? publishDate;
  String? sId;
  int? iV;

  carListModel(
      {this.userId,
        this.ownerName,
        this.phone,
        this.facebookLink,
        this.telegramLink,
        this.car,
        this.price,
        this.publishDate,
        this.sId,
        this.iV});

  carListModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    ownerName = json['ownerName'];
    phone = json['phone'];
    facebookLink = json['facebookLink'];
    telegramLink = json['telegramLink'];
    car = json['car'] != null ? new Car.fromJson(json['car']) : null;
    price = json['price'];
    publishDate = json['publishDate'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['ownerName'] = this.ownerName;
    data['phone'] = this.phone;
    data['facebookLink'] = this.facebookLink;
    data['telegramLink'] = this.telegramLink;
    if (this.car != null) {
      data['car'] = this.car!.toJson();
    }
    data['price'] = this.price;
    data['publishDate'] = this.publishDate;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

class Car {
  List<String>? images;
  String? sId;
  String? type;
  String? description;
  String? category;

  Car({this.images, this.sId, this.type, this.description, this.category});

  Car.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    sId = json['_id'];
    type = json['type'];
    description = json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['description'] = this.description;
    data['category'] = this.category;
    return data;
  }
}