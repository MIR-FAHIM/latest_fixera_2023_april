// To parse this JSON data, do
//
//     final seeVendorProfileModel = seeVendorProfileModelFromJson(jsonString);

import 'dart:convert';

SeeVendorProfileModel seeVendorProfileModelFromJson(String str) => SeeVendorProfileModel.fromJson(json.decode(str));

String seeVendorProfileModelToJson(SeeVendorProfileModel data) => json.encode(data.toJson());

class SeeVendorProfileModel {
  bool error;
  Results results;

  SeeVendorProfileModel({
    required this.error,
    required this.results,
  });

  factory SeeVendorProfileModel.fromJson(Map<String, dynamic> json) => SeeVendorProfileModel(
    error: json["error"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "results": results.toJson(),
  };
}

class Results {
  int id;
  String avatar;
  String banner;
  String name;
  String tagline;
  bool verifyStatus;
  bool isFavourite;
  String about;
  String role;
  List<Job> jobs;

  Results({
    required this.id,
    required this.avatar,
    required this.banner,
    required this.name,
    required this.tagline,
    required this.verifyStatus,
    required this.isFavourite,
    required this.about,
    required this.role,
    required this.jobs,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    id: json["id"],
    avatar: json["avatar"],
    banner: json["banner"],
    name: json["name"],
    tagline: json["tagline"],
    verifyStatus: json["verify_status"],
    isFavourite: json["isFavourite"],
    about: json["about"],
    role: json["role"],
    jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "banner": banner,
    "name": name,
    "tagline": tagline,
    "verify_status": verifyStatus,
    "isFavourite": isFavourite,
    "about": about,
    "role": role,
    "jobs": List<dynamic>.from(jobs.map((x) => x.toJson())),
  };
}

class Job {
  int id;
  String slug;
  String employer;
  bool verifyStatus;
  String title;
  int price;
  String location;
  String type;
  String duration;
  bool isFeatured;
  bool isFavourite;
  int paymentStatus;
  String jobUrl;

  Job({
    required this.id,
    required this.slug,
    required this.employer,
    required this.verifyStatus,
    required this.title,
    required this.price,
    required this.location,
    required this.type,
    required this.duration,
    required this.isFeatured,
    required this.isFavourite,
    required this.paymentStatus,
    required this.jobUrl,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    slug: json["slug"],
    employer: json["employer"],
    verifyStatus: json["verify_status"],
    title: json["title"],
    price: json["price"],
    location: json["location"],
    type: json["type"],
    duration: json["duration"],
    isFeatured: json["isFeatured"],
    isFavourite: json["isFavourite"],
    paymentStatus: json["payment_status"],
    jobUrl: json["job_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "employer": employer,
    "verify_status": verifyStatus,
    "title": title,
    "price": price,
    "location": location,
    "type": type,
    "duration": duration,
    "isFeatured": isFeatured,
    "isFavourite": isFavourite,
    "payment_status": paymentStatus,
    "job_url": jobUrl,
  };
}
