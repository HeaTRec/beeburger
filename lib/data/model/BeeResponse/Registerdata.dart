class Registerdata {
  Registerdata({
      this.otp, 
      this.token,});

  Registerdata.fromJson(dynamic json) {
    otp = json['otp'];
    token = json['token'];
  }
  int otp;
  String token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp'] = otp;
    map['token'] = token;
    return map;
  }

}