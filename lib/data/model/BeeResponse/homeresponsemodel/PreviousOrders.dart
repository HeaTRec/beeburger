import 'Items.dart';

class PreviousOrders {
  PreviousOrders({
      this.id, 
      this.orderId, 
      this.status, 
      this.orderedOn, 
      this.totalPrice, 
      this.address, 
      this.items,});

  PreviousOrders.fromJson(dynamic json) {
    id = json['id'];
    orderId = json['order_id'];
    status = json['status'];
    orderedOn = json['ordered_on'];
    totalPrice = json['total_price'];
    address = json['address'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(Items.fromJson(v));
      });
    }
  }
  int id;
  String orderId;
  int status;
  String orderedOn;
  double totalPrice;
  String address;
  List<Items> items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['order_id'] = orderId;
    map['status'] = status;
    map['ordered_on'] = orderedOn;
    map['total_price'] = totalPrice;
    map['address'] = address;
    if (items != null) {
      map['items'] = items.map((v) => v.toJson()).toList();
    }
    return map;
  }

}