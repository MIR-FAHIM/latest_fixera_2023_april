// To parse this JSON data, do
//
//     final getReferralList = getReferralListFromJson(jsonString);

import 'dart:convert';

GetReferralList getReferralListFromJson(String str) => GetReferralList.fromJson(json.decode(str));

String getReferralListToJson(GetReferralList data) => json.encode(data.toJson());

class GetReferralList {
  bool? error;
  Results? results;

  GetReferralList({
     this.error,
     this.results,
  });

  factory GetReferralList.fromJson(Map<String, dynamic> json) => GetReferralList(
    error: json["error"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "results": results!.toJson(),
  };
}

class Results {
  List<DatumRef> data;
  Pagination pagination;

  Results({
    required this.data,
    required this.pagination,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    data: List<DatumRef>.from(json["data"].map((x) => DatumRef.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class DatumRef {
  String referredUserName;
  String referredUserEmail;
  String referredUserPhone;
  dynamic referredUserAvatar;
  bool isPurchased;
  DateTime referredAt;

  DatumRef({
    required this.referredUserName,
    required this.referredUserEmail,
    required this.referredUserPhone,
    required this.referredUserAvatar,
    required this.isPurchased,
    required this.referredAt,
  });

  factory DatumRef.fromJson(Map<String, dynamic> json) => DatumRef(
    referredUserName: json["referred_user_name"],
    referredUserEmail: json["referred_user_email"],
    referredUserPhone: json["referred_user_phone"],
    referredUserAvatar: json["referred_user_avatar"],
    isPurchased: json["is_purchased"],
    referredAt: DateTime.parse(json["referred_at"]),
  );

  Map<String, dynamic> toJson() => {
    "referred_user_name": referredUserName,
    "referred_user_email": referredUserEmail,
    "referred_user_phone": referredUserPhone,
    "referred_user_avatar": referredUserAvatar,
    "is_purchased": isPurchased,
    "referred_at": referredAt.toIso8601String(),
  };
}

class Pagination {
  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;

  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
  };
}
