// To parse this JSON data, do
//
//     final hospitalCostOfTestListUnderTextModel = hospitalCostOfTestListUnderTextModelFromJson(jsonString);

import 'dart:convert';

HospitalCostOfTestListUnderTextModel hospitalCostOfTestListUnderTextModelFromJson(String str) => HospitalCostOfTestListUnderTextModel.fromJson(json.decode(str));

String hospitalCostOfTestListUnderTextModelToJson(HospitalCostOfTestListUnderTextModel data) => json.encode(data.toJson());

class HospitalCostOfTestListUnderTextModel {
  String status;
  String message;
  List<Result> result;

  HospitalCostOfTestListUnderTextModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory HospitalCostOfTestListUnderTextModel.fromJson(Map<String, dynamic> json) => HospitalCostOfTestListUnderTextModel(
    status: json["status"],
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  int testId;
  List<Hospital> hospitals;
  int priceAfterDiscount;
  Test test;

  Result({
    required this.testId,
    required this.hospitals,
    required this.priceAfterDiscount,
    required this.test,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    testId: json["test_id"],
    hospitals: List<Hospital>.from(json["hospitals"].map((x) => Hospital.fromJson(x))),
    priceAfterDiscount: json["price_after_discount"],
    test: Test.fromJson(json["test"]),
  );

  Map<String, dynamic> toJson() => {
    "test_id": testId,
    "hospitals": List<dynamic>.from(hospitals.map((x) => x.toJson())),
    "price_after_discount": priceAfterDiscount,
    "test": test.toJson(),
  };
}

class Hospital {
  int testId;
  String testTitle;
  String hospitalName;
  String hospitalBranch;
  String latitude;
  String longitude;
  String hospitalPhoto;
  int price;
  int discount;
  int priceAfterDiscount;

  Hospital({
    required this.testId,
    required this.testTitle,
    required this.hospitalName,
    required this.hospitalBranch,
    required this.latitude,
    required this.longitude,
    required this.hospitalPhoto,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
    testId: json["test_id"],
    testTitle: json["test_title"],
    hospitalName: json["hospital_name"],
    hospitalBranch: json["hospital_branch"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    hospitalPhoto: json["hospital_photo"],
    price: json["price"],
    discount: json["discount"],
    priceAfterDiscount: json["price_after_discount"],
  );

  Map<String, dynamic> toJson() => {
    "test_id": testId,
    "test_title": testTitle,
    "hospital_name": hospitalName,
    "hospital_branch": hospitalBranch,
    "latitude": latitude,
    "longitude": longitude,
    "hospital_photo": hospitalPhoto,
    "price": price,
    "discount": discount,
    "price_after_discount": priceAfterDiscount,
  };
}

class Test {
  int id;
  String title;

  Test({
    required this.id,
    required this.title,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
