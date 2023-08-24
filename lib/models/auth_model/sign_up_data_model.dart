// To parse this JSON data, do
//
//     final signUpDataListModel = signUpDataListModelFromJson(jsonString);

import 'dart:convert';

SignUpDataListModel signUpDataListModelFromJson(String str) => SignUpDataListModel.fromJson(json.decode(str));

String signUpDataListModelToJson(SignUpDataListModel data) => json.encode(data.toJson());

class SignUpDataListModel {
  bool error;
  Results results;

  SignUpDataListModel({
    required this.error,
    required this.results,
  });

  factory SignUpDataListModel.fromJson(Map<String, dynamic> json) => SignUpDataListModel(
    error: json["error"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "results": results.toJson(),
  };
}

class Results {
  List<EmployeeCount> employeeCount;
  List<Department> departments;
  List<Category> locations;
  List<Category> categories;
  List<Role> roles;

  Results({
    required this.employeeCount,
    required this.departments,
    required this.locations,
    required this.categories,
    required this.roles,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    employeeCount: List<EmployeeCount>.from(json["employee_count"].map((x) => EmployeeCount.fromJson(x))),
    departments: List<Department>.from(json["departments"].map((x) => Department.fromJson(x))),
    locations: List<Category>.from(json["locations"].map((x) => Category.fromJson(x))),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "employee_count": List<dynamic>.from(employeeCount.map((x) => x.toJson())),
    "departments": List<dynamic>.from(departments.map((x) => x.toJson())),
    "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String title;

  Category({
    required this.id,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}

class Department {
  int id;
  String title;
  String slug;

  Department({
    required this.id,
    required this.title,
    required this.slug,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
  };
}

class EmployeeCount {
  String title;
  String searchTitle;
  int value;

  EmployeeCount({
    required this.title,
    required this.searchTitle,
    required this.value,
  });

  factory EmployeeCount.fromJson(Map<String, dynamic> json) => EmployeeCount(
    title: json["title"],
    searchTitle: json["search_title"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "search_title": searchTitle,
    "value": value,
  };
}

class Role {
  int id;
  String name;
  String roleType;

  Role({
    required this.id,
    required this.name,
    required this.roleType,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    roleType: json["role_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role_type": roleType,
  };
}
