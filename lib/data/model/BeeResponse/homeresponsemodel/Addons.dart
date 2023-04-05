class Addons {
  Addons({
      this.id, 
      this.name, 
      this.price, 
      this.tax, 
      this.category, 
      this.createdAt, 
      this.updatedAt, 
      this.defPrice,});

  Addons.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    tax = json['tax'];
    category = json['category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    defPrice = json['def_price'];
  }
  int id;
  String name;
  String price;
  String tax;
  dynamic category;
  String createdAt;
  String updatedAt;
  int defPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['tax'] = tax;
    map['category'] = category;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['def_price'] = defPrice;
    return map;
  }

}