// To parse this JSON data, do
//
//     final cOntractorFullProfileModel = cOntractorFullProfileModelFromJson(jsonString);

import 'dart:convert';

COntractorFullProfileModel cOntractorFullProfileModelFromJson(String str) => COntractorFullProfileModel.fromJson(json.decode(str));

String cOntractorFullProfileModelToJson(COntractorFullProfileModel data) => json.encode(data.toJson());

class COntractorFullProfileModel {
  bool error;
  Results results;

  COntractorFullProfileModel({
    required this.error,
    required this.results,
  });

  factory COntractorFullProfileModel.fromJson(Map<String, dynamic> json) => COntractorFullProfileModel(
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
  String name;
  String avatar;
  String banner;
  String tagline;
  String hourlyRate;
  bool isFavourite;
  bool verifyStatus;
  String rating;
  String since;
  int feedback;
  String about;
  String locationFlag;
  String location;
  int ongoingJobs;
  int completedJobs;
  int canceledJobs;
  int earning;
  String category;
  List<dynamic> skills;
  List<dynamic> awards;
  String awardImagePath;
  List<dynamic> projects;
  String projectImagePath;
  List<dynamic> educations;
  List<dynamic> experiences;
  List<dynamic> feedbackLists;

  Results({
    required this.id,
    required this.name,
    required this.avatar,
    required this.banner,
    required this.tagline,
    required this.hourlyRate,
    required this.isFavourite,
    required this.verifyStatus,
    required this.rating,
    required this.since,
    required this.feedback,
    required this.about,
    required this.locationFlag,
    required this.location,
    required this.ongoingJobs,
    required this.completedJobs,
    required this.canceledJobs,
    required this.earning,
    required this.category,
    required this.skills,
    required this.awards,
    required this.awardImagePath,
    required this.projects,
    required this.projectImagePath,
    required this.educations,
    required this.experiences,
    required this.feedbackLists,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
    banner: json["banner"],
    tagline: json["tagline"],
    hourlyRate: json["hourly_rate"],
    isFavourite: json["isFavourite"],
    verifyStatus: json["verify_status"],
    rating: json["rating"],
    since: json["since"],
    feedback: json["feedback"],
    about: json["about"],
    locationFlag: json["location_flag"],
    location: json["location"],
    ongoingJobs: json["ongoing_jobs"],
    completedJobs: json["completed_jobs"],
    canceledJobs: json["canceled_jobs"],
    earning: json["earning"],
    category: json["category"],
    skills: List<dynamic>.from(json["skills"].map((x) => x)),
    awards: List<dynamic>.from(json["awards"].map((x) => x)),
    awardImagePath: json["award_image_path"],
    projects: List<dynamic>.from(json["projects"].map((x) => x)),
    projectImagePath: json["project_image_path"],
    educations: List<dynamic>.from(json["educations"].map((x) => x)),
    experiences: List<dynamic>.from(json["experiences"].map((x) => x)),
    feedbackLists: List<dynamic>.from(json["feedback_lists"].map((x) => x)),
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
    "since": since,
    "feedback": feedback,
    "about": about,
    "location_flag": locationFlag,
    "location": location,
    "ongoing_jobs": ongoingJobs,
    "completed_jobs": completedJobs,
    "canceled_jobs": canceledJobs,
    "earning": earning,
    "category": category,
    "skills": List<dynamic>.from(skills.map((x) => x)),
    "awards": List<dynamic>.from(awards.map((x) => x)),
    "award_image_path": awardImagePath,
    "projects": List<dynamic>.from(projects.map((x) => x)),
    "project_image_path": projectImagePath,
    "educations": List<dynamic>.from(educations.map((x) => x)),
    "experiences": List<dynamic>.from(experiences.map((x) => x)),
    "feedback_lists": List<dynamic>.from(feedbackLists.map((x) => x)),
  };
}
