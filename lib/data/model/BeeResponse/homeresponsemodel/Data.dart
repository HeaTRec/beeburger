import 'HighRatingBurger.dart';
import 'Categories.dart';
import 'PreviousOrders.dart';

class Data {
  Data({
      this.highRatingBurger, 
      this.categories, 
      this.previousOrders, 
      this.totalCart,});

  Data.fromJson(dynamic json) {
    if (json['high_rating_burger'] != null) {
      highRatingBurger = [];
      json['high_rating_burger'].forEach((v) {
        highRatingBurger.add(HighRatingBurger.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }
    if (json['previous_orders'] != null) {
      previousOrders = [];
      json['previous_orders'].forEach((v) {
        previousOrders.add(PreviousOrders.fromJson(v));
      });
    }
    totalCart = json['total_cart'];
  }
  List<HighRatingBurger> highRatingBurger;
  List<Categories> categories;
  List<PreviousOrders> previousOrders;
  int totalCart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (highRatingBurger != null) {
      map['high_rating_burger'] = highRatingBurger.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      map['categories'] = categories.map((v) => v.toJson()).toList();
    }
    if (previousOrders != null) {
      map['previous_orders'] = previousOrders.map((v) => v.toJson()).toList();
    }
    map['total_cart'] = totalCart;
    return map;
  }

}