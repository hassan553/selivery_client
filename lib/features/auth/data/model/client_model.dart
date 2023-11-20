class ClientModel {
  User? user;
  String? token;
  String? message;

  ClientModel({this.user, this.token, this.message});

  ClientModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['message'] = message;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  bool? verified;
  String? password;
  String? image;
  String? role;
  bool? available;
  int? iV;

  User(
      {this.sId,
      this.name,
      this.email,
      this.verified,
      this.password,
      this.image,
      this.role,
      this.available,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    verified = json['verified'];
    password = json['password'];
    image = json['image'];
    role = json['role'];
    available = json['available'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['verified'] = this.verified;
    data['password'] = this.password;
    data['image'] = this.image;
    data['role'] = this.role;
    data['available'] = this.available;
    data['__v'] = this.iV;
    return data;
  }
}
