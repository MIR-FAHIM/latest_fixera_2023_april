// To parse this JSON data, do
//
//     final getContractorModel = getContractorModelFromJson(jsonString);

import 'dart:convert';

GetContractorModel getContractorModelFromJson(String str) => GetContractorModel.fromJson(json.decode(str));

String getContractorModelToJson(GetContractorModel data) => json.encode(data.toJson());

class GetContractorModel {
  bool error;
  Results results;

  GetContractorModel({
    required this.error,
    required this.results,
  });

  factory GetContractorModel.fromJson(Map<String, dynamic> json) => GetContractorModel(
    error: json["error"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "results": results.toJson(),
  };
}

class Results {
  String type;
  Users users;
  List<Category> categories;
  List<Language> locations;
  List<Language> languages;
  List<Language> skills;
  ProjectLength projectLength;
  String keyword;
  int usersTotalRecords;
  List<dynamic> saveFreelancer;
  Symbol symbol;
  DateTime currentDate;
  HourlyRates hourlyRates;
  Map<String, String> contractorType;
  EnglishLevel englishLevel;

  Results({
    required this.type,
    required this.users,
    required this.categories,
    required this.locations,
    required this.languages,
    required this.skills,
    required this.projectLength,
    required this.keyword,
    required this.usersTotalRecords,
    required this.saveFreelancer,
    required this.symbol,
    required this.currentDate,
    required this.hourlyRates,
    required this.contractorType,
    required this.englishLevel,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    type: json["type"],
    users: Users.fromJson(json["users"]),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    locations: List<Language>.from(json["locations"].map((x) => Language.fromJson(x))),
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
    skills: List<Language>.from(json["skills"].map((x) => Language.fromJson(x))),
    projectLength: ProjectLength.fromJson(json["project_length"]),
    keyword: json["keyword"],
    usersTotalRecords: json["users_total_records"],
    saveFreelancer: List<dynamic>.from(json["save_freelancer"].map((x) => x)),
    symbol: Symbol.fromJson(json["symbol"]),
    currentDate: DateTime.parse(json["current_date"]),
    hourlyRates: HourlyRates.fromJson(json["hourly_rates"]),
    contractorType: Map.from(json["contractor_type"]).map((k, v) => MapEntry<String, String>(k, v)),
    englishLevel: EnglishLevel.fromJson(json["english_level"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "users": users.toJson(),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    "project_length": projectLength.toJson(),
    "keyword": keyword,
    "users_total_records": usersTotalRecords,
    "save_freelancer": List<dynamic>.from(saveFreelancer.map((x) => x)),
    "symbol": symbol.toJson(),
    "current_date": currentDate.toIso8601String(),
    "hourly_rates": hourlyRates.toJson(),
    "contractor_type": Map.from(contractorType).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "english_level": englishLevel.toJson(),
  };
}

class Category {
  int id;
  String title;
  String slug;
  String categoryAbstract;
  String? image;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.title,
    required this.slug,
    required this.categoryAbstract,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    categoryAbstract: json["abstract"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "abstract": categoryAbstract,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class EnglishLevel {
  String basic;
  String conversational;
  String fluent;
  String native;
  String professional;

  EnglishLevel({
    required this.basic,
    required this.conversational,
    required this.fluent,
    required this.native,
    required this.professional,
  });

  factory EnglishLevel.fromJson(Map<String, dynamic> json) => EnglishLevel(
    basic: json["basic"],
    conversational: json["conversational"],
    fluent: json["fluent"],
    native: json["native"],
    professional: json["professional"],
  );

  Map<String, dynamic> toJson() => {
    "basic": basic,
    "conversational": conversational,
    "fluent": fluent,
    "native": native,
    "professional": professional,
  };
}

class HourlyRates {
  String the05;
  String the510;
  String the1020;
  String the2030;
  String the3040;
  String the4050;
  String the5060;
  String the6070;
  String the7080;
  String the900;

  HourlyRates({
    required this.the05,
    required this.the510,
    required this.the1020,
    required this.the2030,
    required this.the3040,
    required this.the4050,
    required this.the5060,
    required this.the6070,
    required this.the7080,
    required this.the900,
  });

  factory HourlyRates.fromJson(Map<String, dynamic> json) => HourlyRates(
    the05: json["0-5"],
    the510: json["5-10"],
    the1020: json["10-20"],
    the2030: json["20-30"],
    the3040: json["30-40"],
    the4050: json["40-50"],
    the5060: json["50-60"],
    the6070: json["60-70"],
    the7080: json["70-80"],
    the900: json["90-0"],
  );

  Map<String, dynamic> toJson() => {
    "0-5": the05,
    "5-10": the510,
    "10-20": the1020,
    "20-30": the2030,
    "30-40": the3040,
    "40-50": the4050,
    "50-60": the5060,
    "60-70": the6070,
    "70-80": the7080,
    "90-0": the900,
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

class Symbol {
  String code;
  String name;
  String symbol;

  Symbol({
    required this.code,
    required this.name,
    required this.symbol,
  });

  factory Symbol.fromJson(Map<String, dynamic> json) => Symbol(
    code: json["code"],
    name: json["name"],
    symbol: json["symbol"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "symbol": symbol,
  };
}

class Users {
  List<Datum> data;
  Pagination pagination;

  Users({
    required this.data,
    required this.pagination,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class Datum {
  int id;
  String name;
  String avatar;
  String banner;
  String tagline;
  dynamic hourlyRate;
  bool isFavourite;
  bool verifyStatus;
  String rating;

  Datum({
    required this.id,
    required this.name,
    required this.avatar,
    required this.banner,
    required this.tagline,
    required this.hourlyRate,
    required this.isFavourite,
    required this.verifyStatus,
    required this.rating,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
    banner: json["banner"],
    tagline: json["tagline"],
    hourlyRate: json["hourly_rate"],
    isFavourite: json["isFavourite"],
    verifyStatus: json["verify_status"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatar": avatar,
    "banner": banner,
    "tagline": tagline,
    "hourly_rate": hourlyRate,
    "isFavourite": isFavourite,
    "verify_status": verifyStatus,
    "rating": rating,
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
