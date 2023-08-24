// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? error;
  String? accessToken;
  String? tokenType;
  int? expiryTime;
  UserInfo? userInfo;

  LoginModel({
     this.error,
     this.accessToken,
     this.tokenType,
     this.expiryTime,
     this.userInfo,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    error: json["error"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiryTime: json["expiry_time"],
    userInfo: UserInfo.fromJson(json["user_info"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "access_token": accessToken,
    "token_type": tokenType,
    "expiry_time": expiryTime,
    "user_info": userInfo!.toJson(),
  };
}

class UserInfo {
  int id;
  String firstName;
  String lastName;
  String hourlyRate;
  String tagline;
  var locationId;
  String country;
  String address;
  String longitude;
  String latitude;
  String avatar;
  String banner;
  int roleId;
  String roleName;
  int profileCompletionStatus;
  dynamic deviceId;
  dynamic phone;

  UserInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.hourlyRate,
    required this.tagline,
    required this.locationId,
    required this.country,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.avatar,
    required this.banner,
    required this.roleId,
    required this.roleName,
    required this.profileCompletionStatus,
    this.deviceId,
    this.phone,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    hourlyRate: json["hourly_rate"],
    tagline: json["tagline"],
    locationId: json["location_id"],
    country: json["country"],
    address: json["address"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    avatar: json["avatar"],
    banner: json["banner"],
    roleId: json["role_id"],
    roleName: json["role_name"],
    profileCompletionStatus: json["profile_completion_status"],
    deviceId: json["device_id"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "hourly_rate": hourlyRate,
    "tagline": tagline,
    "location_id": locationId,
    "country": country,
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
    "avatar": avatar,
    "banner": banner,
    "role_id": roleId,
    "role_name": roleName,
    "profile_completion_status": profileCompletionStatus,
    "device_id": deviceId,
    "phone": phone,
  };
}
