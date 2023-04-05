class Items {
  Items({
      this.productId, 
      this.cartId, 
      this.productName, 
      this.quantity, 
      this.description, 
      this.price, 
      this.tax, 
      this.addons,});

  Items.fromJson(dynamic json) {
    productId = json['product_id'];
    cartId = json['cart_id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    description = json['description'];
    price = json['price'];
    tax = json['tax'];
    if (json['addons'] != null) {
      addons = [];
      json['addons'].forEach((v) {
        addons.add(Dynamic.fromJson(v));
      });
    }
  }
  int productId;
  int cartId;
  String productName;
  int quantity;
  dynamic description;
  String price;
  dynamic tax;
  List<dynamic> addons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['cart_id'] = cartId;
    map['product_name'] = productName;
    map['quantity'] = quantity;
    map['description'] = description;
    map['price'] = price;
    map['tax'] = tax;
    if (addons != null) {
      map['addons'] = addons.map((v) => v.toJson()).toList();
    }
    return map;
  }

}