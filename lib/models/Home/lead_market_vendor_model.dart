// To parse this JSON data, do
//
//     final getLeadMarketVendorModel = getLeadMarketVendorModelFromJson(jsonString);

import 'dart:convert';

GetLeadMarketVendorModel getLeadMarketVendorModelFromJson(String str) => GetLeadMarketVendorModel.fromJson(json.decode(str));

String getLeadMarketVendorModelToJson(GetLeadMarketVendorModel data) => json.encode(data.toJson());

class GetLeadMarketVendorModel {
  bool error;
  Results results;

  GetLeadMarketVendorModel({
    required this.error,
    required this.results,
  });

  factory GetLeadMarketVendorModel.fromJson(Map<String, dynamic> json) => GetLeadMarketVendorModel(
    error: json["error"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "results": results.toJson(),
  };
}

class Results {
  List<VendorDatum> users;
  List<Language> locations;
  List<Language> languages;
  Map<String, String> freelancerSkills;
  ProjectLength projectLength;
  String keyword;
  String type;
  int usersTotalRecords;
  List<dynamic> saveEmployer;
  DateTime currentDate;

  Results({
    required this.users,
    required this.locations,
    required this.languages,
    required this.freelancerSkills,
    required this.projectLength,
    required this.keyword,
    required this.type,
    required this.usersTotalRecords,
    required this.saveEmployer,
    required this.currentDate,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    users:List<VendorDatum>.from(json["users"].map((x) => VendorDatum.fromJson(x))),
    locations: List<Language>.from(json["locations"].map((x) => Language.fromJson(x))),
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
    freelancerSkills: Map.from(json["freelancer_skills"]).map((k, v) => MapEntry<String, String>(k, v)),
    projectLength: ProjectLength.fromJson(json["project_length"]),
    keyword: json["keyword"],
    type: json["type"],
    usersTotalRecords: json["users_total_records"],
    saveEmployer: List<dynamic>.from(json["save_employer"].map((x) => x)),
    currentDate: DateTime.parse(json["current_date"]),
  );

  Map<String, dynamic> toJson() => {
    "users":  List<dynamic>.from(users.map((x) => x.toJson())),
    "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    "freelancer_skills": Map.from(freelancerSkills).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "project_length": projectLength.toJson(),
    "keyword": keyword,
    "type": type,
    "users_total_records": usersTotalRecords,
    "save_employer": List<dynamic>.from(saveEmployer.map((x) => x)),
    "current_date": currentDate.toIso8601String(),
  };
}

class Language {
  int id;
  String title;
  String slug;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  int? parent;
  String? flag;

  Language({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.parent,
    this.flag,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    parent: json["parent"],
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "parent": parent,
    "flag": flag,
  };
}

class ProjectLength {
  String weekly;
  String monthly;
  String threeMonth;
  String sixMonth;
  String moreThanSix;

  ProjectLength({
    required this.weekly,
    required this.monthly,
    required this.threeMonth,
    required this.sixMonth,
    required this.moreThanSix,
  });

  factory ProjectLength.fromJson(Map<String, dynamic> json) => ProjectLength(
    weekly: json["weekly"],
    monthly: json["monthly"],
    threeMonth: json["three_month"],
    sixMonth: json["six_month"],
    moreThanSix: json["more_than_six"],
  );

  Map<String, dynamic> toJson() => {
    "weekly": weekly,
    "monthly": monthly,
    "three_month": threeMonth,
    "six_month": sixMonth,
    "more_than_six": moreThanSix,
  };
}



class VendorDatum {
  int id;
  String avatar;
  String banner;
  String name;
  String tagline;
  bool verifyStatus;
  bool isFavourite;

  VendorDatum({
    required this.id,
    required this.avatar,
    required this.banner,
    required this.name,
    required this.tagline,
    required this.verifyStatus,
    required this.isFavourite,
  });

  factory VendorDatum.fromJson(Map<String, dynamic> json) => VendorDatum(
    id: json["id"],
    avatar: json["avatar"],
    banner: json["banner"],
    name: json["name"],
    tagline: json["tagline"],
    verifyStatus: json["verify_status"],
    isFavourite: json["isFavourite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "banner": banner,
    "name": name,
    "tagline": tagline,
    "verify_status": verifyStatus,
    "isFavourite": isFavourite,
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
