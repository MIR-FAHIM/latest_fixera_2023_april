// To parse this JSON data, do
//
//     final packageListModel = packageListModelFromJson(jsonString);

import 'dart:convert';

PackageListModel packageListModelFromJson(String str) => PackageListModel.fromJson(json.decode(str));

String packageListModelToJson(PackageListModel data) => json.encode(data.toJson());

class PackageListModel {
  bool? error;
  Results? results;

  PackageListModel({
     this.error,
     this.results,
  });

  factory PackageListModel.fromJson(Map<String, dynamic> json) => PackageListModel(
    error: json["error"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "results": results!.toJson(),
  };
}

class Results {
  bool isAlreadyPurchase;
  bool isPendingRequest;
  List<Package> packages;

  Results({
    required this.isAlreadyPurchase,
    required this.isPendingRequest,
    required this.packages,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    isAlreadyPurchase: json["is_already_purchase"],
    isPendingRequest: json["is_pending_request"],
    packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "is_already_purchase": isAlreadyPurchase,
    "is_pending_request": isPendingRequest,
    "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
  };
}

class Package {
  int id;
  String title;
  String subtitle;
  String cost;
  Options options;

  Package({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.cost,
    required this.options,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    cost: json["cost"],
    options: Options.fromJson(json["options"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "cost": cost,
    "options": options.toJson(),
  };
}

class Options {
  String duration;
  String jobs;
  String featuredJobs;
  String noOfConnects;

  Options({
    required this.duration,
    required this.jobs,
    required this.featuredJobs,
    required this.noOfConnects,
  });

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    duration: json["duration"],
    jobs: json["jobs"],
    featuredJobs: json["featured_jobs"],
    noOfConnects: json["no_of_connects"],
  );

  Map<String, dynamic> toJson() => {
    "duration": duration,
    "jobs": jobs,
    "featured_jobs": featuredJobs,
    "no_of_connects": noOfConnects,
  };
}
