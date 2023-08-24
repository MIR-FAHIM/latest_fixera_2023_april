// To parse this JSON data, do
//
//     final savedItemModel = savedItemModelFromJson(jsonString);

import 'dart:convert';

SavedItemModel savedItemModelFromJson(String str) =>
    SavedItemModel.fromJson(json.decode(str));

String savedItemModelToJson(SavedItemModel data) => json.encode(data.toJson());

class SavedItemModel {
  bool error;
  Results results;

  SavedItemModel({
    required this.error,
    required this.results,
  });

  factory SavedItemModel.fromJson(Map<String, dynamic> json) => SavedItemModel(
        error: json["error"],
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "results": results.toJson(),
      };
}

class Results {
  List<JobSavedItems> jobs;
  List<FreelancerItems> savedFreelancers;
  List<EmployeerItems> savedEmployers;

  Results({
    required this.jobs,
    required this.savedFreelancers,
    required this.savedEmployers,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        jobs: List<JobSavedItems>.from(
            json["jobs"].map((x) => JobSavedItems.fromJson(x))),
        savedFreelancers: List<FreelancerItems>.from(
            json["saved_freelancers"].map((x) => FreelancerItems.fromJson(x))),
        savedEmployers: List<EmployeerItems>.from(
            json["saved_employers"].map((x) => JobSavedItems.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "jobs": List<dynamic>.from(jobs.map((x) => x.toJson())),
        "saved_freelancers":
            List<dynamic>.from(savedFreelancers.map((x) => x.toJson())),
        "saved_employers":
            List<dynamic>.from(savedEmployers.map((x) => x.toJson())),
      };
}

class FreelancerItems {
  int id;
  String avatar;
  String banner;
  String name;
  String tagLine;
  String hourlyRate;
  String rating;

  bool isFavourite;

  bool verifyStatus;

  FreelancerItems({
    required this.id,
    required this.avatar,
    required this.verifyStatus,
    required this.banner,
    required this.tagLine,
    required this.name,
    required this.rating,
    required this.hourlyRate,
    required this.isFavourite,
  });

  factory FreelancerItems.fromJson(Map<String, dynamic> json) =>
      FreelancerItems(
        id: json["id"],
        verifyStatus: json["verify_status"],
        avatar: json["avatar"],
        banner: json["banner"],
        tagLine: json["tagline"],
        name: json["name"],
        hourlyRate: json["hourly_rate"],
        rating: json["rating"],
        isFavourite: json["isFavourite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "banner": banner,
        "avatar": avatar,
        "verify_status": verifyStatus,
        "tagline": tagLine,
        "name": name,
        "rating": name,
        "hourly_rate": name,
        "isFavourite": isFavourite,
      };
}

class EmployeerItems {
  int id;
  String avatar;
  String banner;
  String name;
  String tagLine;

  bool isFavourite;

  bool verifyStatus;

  EmployeerItems({
    required this.id,
    required this.avatar,
    required this.verifyStatus,
    required this.banner,
    required this.tagLine,
    required this.name,
    required this.isFavourite,
  });

  factory EmployeerItems.fromJson(Map<String, dynamic> json) => EmployeerItems(
        id: json["id"],
        verifyStatus: json["verify_status"],
        avatar: json["avatar"],
        banner: json["banner"],
        tagLine: json["tagline"],
        name: json["name"],
        isFavourite: json["isFavourite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "banner": banner,
        "avatar": avatar,
        "verify_status": verifyStatus,
        "tagline": tagLine,
        "name": name,
        "isFavourite": isFavourite,
      };
}

class JobSavedItems {
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

  JobSavedItems({
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

  factory JobSavedItems.fromJson(Map<String, dynamic> json) => JobSavedItems(
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
