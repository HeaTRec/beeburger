class SignUpBody {
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNo;
  String address;
  String latitude;
  String longitude;
  String deviceType;
  String deviceToken;
  String title;

  SignUpBody({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNo,
    this.address,
    this.latitude,
    this.longitude,
    this.deviceType,
    this.deviceToken,
    this.title,});

  SignUpBody.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    phoneNo = json['phone_no'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    title = json['title'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['password'] = password;
    map['phone_no'] = phoneNo;
    map['address'] = address;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['device_type'] = deviceType;
    map['device_token'] = deviceToken;
    map['title'] = title;
    return map;
  }
}
