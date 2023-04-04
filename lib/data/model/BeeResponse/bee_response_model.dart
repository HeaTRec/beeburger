import 'Data.dart';

class BeeResponseModel {
  BeeResponseModel({
      this.statusCode, 
      this.message, 
      this.data,});

  BeeResponseModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int statusCode;
  String message;
  Data data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data.toJson();
    }
    return map;
  }

}