class HomeApiListModel {
  bool? error;
  Results? results;

  HomeApiListModel({this.error, this.results});

  HomeApiListModel.fromJson(Map<String, dynamic> json) {
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
  List<Categories>? categories;
  List<FeaturedContractors>? featuredContractors;
  List<LatestJobs>? latestJobs;

  Results({this.categories, this.featuredContractors, this.latestJobs});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['featured_contractors'] != null) {
      featuredContractors = [];
      json['featured_contractors'].forEach((v) {
        featuredContractors!.add(new FeaturedContractors.fromJson(v));
      });
    }
    if (json['latest_jobs'] != null) {
      latestJobs = [];
      json['latest_jobs'].forEach((v) {
        latestJobs!.add(new LatestJobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.featuredContractors != null) {
      data['featured_contractors'] =
          this.featuredContractors!.map((v) => v.toJson()).toList();
    }
    if (this.latestJobs != null) {
      data['latest_jobs'] = this.latestJobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? image;
  String? link;
  String? name;
  String? slug;
  int? termId;
  String? description;
  int? items;

  Categories(
      {this.image,
        this.link,
        this.name,
        this.slug,
        this.termId,
        this.description,
        this.items});

  Categories.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    link = json['link'];
    name = json['name'];
    slug = json['slug'];
    termId = json['term_id'];
    description = json['description'];
    items = json['items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['link'] = this.link;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['term_id'] = this.termId;
    data['description'] = this.description;
    data['items'] = this.items;
    return data;
  }
}

class FeaturedContractors {
  int? id;
  String? name;
  String? avatar;
  String? banner;
  String? tagline;
  var hourlyRate;
  bool? isFavourite;
  bool? verifyStatus;
  String? rating;

  FeaturedContractors(
      {this.id,
        this.name,
        this.avatar,
        this.banner,
        this.tagline,
        this.hourlyRate,
        this.isFavourite,
        this.verifyStatus,
        this.rating});

  FeaturedContractors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    banner = json['banner'];
    tagline = json['tagline'];
    hourlyRate = json['hourly_rate'];
    isFavourite = json['isFavourite'];
    verifyStatus = json['verify_status'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['banner'] = this.banner;
    data['tagline'] = this.tagline;
    data['hourly_rate'] = this.hourlyRate;
    data['isFavourite'] = this.isFavourite;
    data['verify_status'] = this.verifyStatus;
    data['rating'] = this.rating;
    return data;
  }
}

class LatestJobs {
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

  LatestJobs(
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

  LatestJobs.fromJson(Map<String, dynamic> json) {
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