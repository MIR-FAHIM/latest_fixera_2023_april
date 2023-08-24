// To parse this JSON data, do
//
//     final categoryTypeModel = categoryTypeModelFromJson(jsonString);

import 'dart:convert';

CategoryTypeModel categoryTypeModelFromJson(String str) => CategoryTypeModel.fromJson(json.decode(str));

String categoryTypeModelToJson(CategoryTypeModel data) => json.encode(data.toJson());

class CategoryTypeModel {
  List<Result> results;

  CategoryTypeModel({
    required this.results,
  });

  factory CategoryTypeModel.fromJson(Map<String, dynamic> json) => CategoryTypeModel(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  dynamic image;
  String link;
  String name;
  String slug;
  int termId;
  String description;
  int items;

  Result({
    required this.image,
    required this.link,
    required this.name,
    required this.slug,
    required this.termId,
    required this.description,
    required this.items,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    image: json["image"],
    link: json["link"],
    name: json["name"],
    slug: json["slug"],
    termId: json["term_id"],
    description: json["description"],
    items: json["items"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "link": link,
    "name": name,
    "slug": slug,
    "term_id": termId,
    "description": description,
    "items": items,
  };
}
