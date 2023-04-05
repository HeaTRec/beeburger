import 'Addons.dart';

class HighRatingBurger {
  HighRatingBurger({
      this.id, 
      this.productImage, 
      this.productName, 
      this.description, 
      this.price, 
      this.tax, 
      this.category, 
      this.productType, 
      this.rating, 
      this.addons,});

  HighRatingBurger.fromJson(dynamic json) {
    id = json['id'];
    productImage = json['product_image'];
    productName = json['product_name'];
    description = json['description'];
    price = json['price'];
    tax = json['tax'];
    category = json['category'];
    productType = json['product_type'];
    rating = json['rating'];
    if (json['addons'] != null) {
      addons = [];
      json['addons'].forEach((v) {
        addons.add(Addons.fromJson(v));
      });
    }
  }
  int id;
  String productImage;
  String productName;
  String description;
  String price;
  int tax;
  String category;
  int productType;
  double rating;
  List<Addons> addons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_image'] = productImage;
    map['product_name'] = productName;
    map['description'] = description;
    map['price'] = price;
    map['tax'] = tax;
    map['category'] = category;
    map['product_type'] = productType;
    map['rating'] = rating;
    if (addons != null) {
      map['addons'] = addons.map((v) => v.toJson()).toList();
    }
    return map;
  }

}