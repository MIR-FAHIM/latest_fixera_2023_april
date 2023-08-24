// To parse this JSON data, do
//
//     final buyCreditListModel = buyCreditListModelFromJson(jsonString);

import 'dart:convert';

BuyCreditListModel buyCreditListModelFromJson(String str) => BuyCreditListModel.fromJson(json.decode(str));

String buyCreditListModelToJson(BuyCreditListModel data) => json.encode(data.toJson());

class BuyCreditListModel {
  bool? error;
  Results? results;

  BuyCreditListModel({
     this.error,
     this.results,
  });

  factory BuyCreditListModel.fromJson(Map<String, dynamic> json) => BuyCreditListModel(
    error: json["error"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "results": results!.toJson(),
  };
}

class Results {
  int currentPage;
  List<CreditDatum> data;
  String firstPageUrl;
  //int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  //int to;
  int total;

  Results({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
   // required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
   // required this.to,
    required this.total,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    currentPage: json["current_page"],
    data: List<CreditDatum>.from(json["data"].map((x) => CreditDatum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
   // from: json["from"] ?? 1,
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
   // to: json["to"] ?? 4,
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
   // "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
   // "to": to,
    "total": total,
  };
}

class CreditDatum {
  String purpose;
  int point;
  int status;

  CreditDatum({
    required this.purpose,
    required this.point,
    required this.status,
  });

  factory CreditDatum.fromJson(Map<String, dynamic> json) => CreditDatum(
    purpose: json["purpose"],
    point: json["point"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "purpose": purpose,
    "point": point,
    "status": status,
  };
}
