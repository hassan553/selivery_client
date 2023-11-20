class AdsModel {
  final String? id;
  final String? name;
  final String? description;
  final String? link;
  final String? image;
  final int? views;
  final int? v;

  AdsModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.views,
    this.v,
    this.link,
  });

  factory AdsModel.fromJson(Map json) {
    return AdsModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      views: json['views'],
      link: json['youtubeLink'],
      v: json['__v'],
    );
  }
}
