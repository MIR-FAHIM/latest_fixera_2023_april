class BrowseJobModel {
  bool? error;
  Results? results;

  BrowseJobModel({this.error, this.results});

  BrowseJobModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    results =
    json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  Jobs? jobs;
  List<BrowseCategories>? categories;
  List<Locations>? locations;
  List<Languages>? languages;
  FreelancerSkills? freelancerSkills;
  ProjectLength? projectLength;
  int? jobsTotalRecords;
  String? keyword;
  List<Skills>? skills;
  String? type;
  String? currentDate;
  int? loggedUserRole;

  Results(
      {this.jobs,
        this.categories,
        this.locations,
        this.languages,
        this.freelancerSkills,
        this.projectLength,
        this.jobsTotalRecords,
        this.keyword,
        this.skills,
        this.type,
        this.currentDate,
        this.loggedUserRole});

  Results.fromJson(Map<String, dynamic> json) {
    jobs = json['jobs'] != null ? new Jobs.fromJson(json['jobs']) : null;
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(new BrowseCategories.fromJson(v));
      });
    }
    if (json['locations'] != null) {
      locations = [];
      json['locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = [];
      json['languages'].forEach((v) {
        languages!.add(new Languages.fromJson(v));
      });
    }
    freelancerSkills = json['freelancer_skills'] != null
        ? new FreelancerSkills.fromJson(json['freelancer_skills'])
        : null;
    projectLength = json['project_length'] != null
        ? new ProjectLength.fromJson(json['project_length'])
        : null;
    jobsTotalRecords = json['Jobs_total_records'];
    keyword = json['keyword'];
    projectLength = json['project_length'] != null
        ? new ProjectLength.fromJson(json['project_length'])
        : null;

    type = json['type'];
    currentDate = json['current_date'];
    loggedUserRole = json['loggedUserRole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    if (this.languages != null) {
      data['languages'] = this.languages!.map((v) => v.toJson()).toList();
    }
    if (this.freelancerSkills != null) {
      data['freelancer_skills'] = this.freelancerSkills!.toJson();
    }
    if (this.projectLength != null) {
      data['project_length'] = this.projectLength!.toJson();
    }
    data['Jobs_total_records'] = this.jobsTotalRecords;
    data['keyword'] = this.keyword;
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    data['current_date'] = this.currentDate;
    data['loggedUserRole'] = this.loggedUserRole;
    return data;
  }
}

class Jobs {
  List<JobData>? data;
  Pagination? pagination;

  Jobs({this.data, this.pagination});

  Jobs.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new JobData.fromJson(v));
      });
    }
    pagination = (json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class JobData {
  int? id;
  String? slug;
  String? employer;
  bool? verifyStatus;
  String? title;
  int? price;
  String? location;
  String? type;
  String? duration;
  bool? isFeatured;
  bool? isFavourite;
  int? paymentStatus;
  String? jobUrl;

  JobData(
      {this.id,
        this.slug,
        this.employer,
        this.verifyStatus,
        this.title,
        this.price,
        this.location,
        this.type,
        this.duration,
        this.isFeatured,
        this.isFavourite,
        this.paymentStatus,
        this.jobUrl});

  JobData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    employer = json['employer'];
    verifyStatus = json['verify_status'];
    title = json['title'];
    price = json['price'];
    location = json['location'];
    type = json['type'];
    duration = json['duration'];
    isFeatured = json['isFeatured'];
    isFavourite = json['isFavourite'];
    paymentStatus = json['payment_status'];
    jobUrl = json['job_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['employer'] = this.employer;
    data['verify_status'] = this.verifyStatus;
    data['title'] = this.title;
    data['price'] = this.price;
    data['location'] = this.location;
    data['type'] = this.type;
    data['duration'] = this.duration;
    data['isFeatured'] = this.isFeatured;
    data['isFavourite'] = this.isFavourite;
    data['payment_status'] = this.paymentStatus;
    data['job_url'] = this.jobUrl;
    return data;
  }
}
class Skills {
  int? id;
  String? title;
  String? slug;
  String? description;


  Skills(
      {this.id,
        this.title,
        this.description,
        this.slug,
        });

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;

    return data;
  }
}
class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Pagination(
      {this.total,
        this.count,
        this.perPage,
        this.currentPage,
        this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    return data;
  }
}

class BrowseCategories {
  int? id;
  String? title;
  String? slug;
  String? abstract;
  String? image;
  String? createdAt;
  String? updatedAt;

  BrowseCategories(
      {this.id,
        this.title,
        this.slug,
        this.abstract,
        this.image,
        this.createdAt,
        this.updatedAt});

  BrowseCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    abstract = json['abstract'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['abstract'] = this.abstract;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Locations {
  int? id;
  String? title;
  String? slug;
  int? parent;
  String? flag;
  String? description;
  String? createdAt;
  String? updatedAt;

  Locations(
      {this.id,
        this.title,
        this.slug,
        this.parent,
        this.flag,
        this.description,
        this.createdAt,
        this.updatedAt});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    parent = json['parent'];
    flag = json['flag'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['parent'] = this.parent;
    data['flag'] = this.flag;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Languages {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? createdAt;
  String? updatedAt;

  Languages(
      {this.id,
        this.title,
        this.slug,
        this.description,
        this.createdAt,
        this.updatedAt});

  Languages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class FreelancerSkills {
  String? s3;
  String? s4;
  String? s5;

  FreelancerSkills({this.s3, this.s4, this.s5});

  FreelancerSkills.fromJson(Map<String, dynamic> json) {
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    return data;
  }
}

class ProjectLength {
  String? weekly;
  String? monthly;
  String? threeMonth;
  String? sixMonth;
  String? moreThanSix;

  ProjectLength(
      {this.weekly,
        this.monthly,
        this.threeMonth,
        this.sixMonth,
        this.moreThanSix});

  ProjectLength.fromJson(Map<String, dynamic> json) {
    weekly = json['weekly'];
    monthly = json['monthly'];
    threeMonth = json['three_month'];
    sixMonth = json['six_month'];
    moreThanSix = json['more_than_six'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weekly'] = this.weekly;
    data['monthly'] = this.monthly;
    data['three_month'] = this.threeMonth;
    data['six_month'] = this.sixMonth;
    data['more_than_six'] = this.moreThanSix;
    return data;
  }
}
