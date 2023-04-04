class ForgetResponseModel {
  ForgetResponseModel({
      this.statusCode, 
      this.message, 
      this.otp,});

  ForgetResponseModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    otp = json['otp'];
  }
  int statusCode;
  String message;
  String otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['otp'] = otp;
    return map;
  }

}