class Data {
  Data({
      this.id, 
      this.role, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.username, 
      this.emailVerifiedAt, 
      this.countryCode, 
      this.phoneNo, 
      this.address, 
      this.latitude, 
      this.longitude, 
      this.otp, 
      this.phoneVerified, 
      this.deviceType, 
      this.deviceToken, 
      this.image, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.token,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    role = json['role'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    username = json['username'];
    emailVerifiedAt = json['email_verified_at'];
    countryCode = json['country_code'];
    phoneNo = json['phone_no'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    otp = json['otp'];
    phoneVerified = json['phone_verified'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }
  int id;
  String role;
  String firstName;
  String lastName;
  String email;
  dynamic username;
  dynamic emailVerifiedAt;
  dynamic countryCode;
  String phoneNo;
  dynamic address;
  dynamic latitude;
  dynamic longitude;
  String otp;
  String phoneVerified;
  int deviceType;
  String deviceToken;
  dynamic image;
  int status;
  String createdAt;
  String updatedAt;
  String token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['role'] = role;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['username'] = username;
    map['email_verified_at'] = emailVerifiedAt;
    map['country_code'] = countryCode;
    map['phone_no'] = phoneNo;
    map['address'] = address;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['otp'] = otp;
    map['phone_verified'] = phoneVerified;
    map['device_type'] = deviceType;
    map['device_token'] = deviceToken;
    map['image'] = image;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['token'] = token;
    return map;
  }

}