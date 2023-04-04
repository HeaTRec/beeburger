import 'Registerdata.dart';

class RegisterResponseModel {
  RegisterResponseModel({
      this.statusCode, 
      this.message, 
      this.data,});

  RegisterResponseModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Registerdata.fromJson(json['data']) : null;
  }
  int statusCode;
  String message;
  Registerdata data;

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