class Categories {
  Categories({
      this.id, 
      this.name, 
      this.image, 
      this.createdAt, 
      this.updatedAt,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int id;
  String name;
  String image;
  String createdAt;
  String updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}