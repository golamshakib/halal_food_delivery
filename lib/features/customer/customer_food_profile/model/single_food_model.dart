class SingleFoodModel {
  bool? success;
  String? message;
  Data? data;

  SingleFoodModel({this.success, this.message, this.data});

  SingleFoodModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? name;
  String? description;
  int? price;
  int? offerPrice;
  String? category;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<Review>? review;
  UserDetails? userDetails;
  double? averageRating;
  List<NearestRestaurant>? nearestRestaurant;

  Data(
      {this.id,
      this.userId,
      this.name,
      this.description,
      this.price,
      this.offerPrice,
      this.category,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.review,
      this.userDetails,
      this.averageRating,
      this.nearestRestaurant});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    offerPrice = json['offerPrice'];
    category = json['category'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['Review'] != null) {
      review = <Review>[];
      json['Review'].forEach((v) {
        review!.add( Review.fromJson(v));
      });
    }
    userDetails = json['userDetails'] != null
        ?  UserDetails.fromJson(json['userDetails'])
        : null;
    averageRating = json['averageRating'];
    if (json['nearestRestaurant'] != null) {
      nearestRestaurant = <NearestRestaurant>[];
      json['nearestRestaurant'].forEach((v) {
        nearestRestaurant!.add( NearestRestaurant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['offerPrice'] = offerPrice;
    data['category'] = category;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (review != null) {
      data['Review'] = review!.map((v) => v.toJson()).toList();
    }
    if (userDetails != null) {
      data['userDetails'] = userDetails!.toJson();
    }
    data['averageRating'] = averageRating;
    if (nearestRestaurant != null) {
      data['nearestRestaurant'] =
          nearestRestaurant!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Review {
  String? id;
  String? userId;
  String? foodId;
  double? rating;
  String? comment;
  String? createdAt;
  String? updatedAt;
  ReviewerUserDetails? userDetails;

  Review(
      {this.id,
      this.userId,
      this.foodId,
      this.rating,
      this.comment,
      this.createdAt,
      this.updatedAt,
      this.userDetails});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    foodId = json['foodId'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userDetails = json['userDetails'] != null
        ?  ReviewerUserDetails.fromJson(json['userDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['foodId'] = foodId;
    data['rating'] = rating;
    data['comment'] = comment;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (userDetails != null) {
      data['userDetails'] = userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  String? id;
  String? name;
  String? image;
  String? location;
  double? latitude;
  double? longitude;

  UserDetails(
      {this.id,
      this.name,
      this.image,
      this.location,
      this.latitude,
      this.longitude});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class ReviewerUserDetails {
  String? name;
  String? image;
  String? location;
  double? latitude;
  double? longitude;

  ReviewerUserDetails(
      {this.name, this.image, this.location, this.latitude, this.longitude});

  ReviewerUserDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class NearestRestaurant {
  String? id;
  String? name;
  String? image;
  String? location;
  double? longitude;
  double? latitude;
  double? averageRating;

  NearestRestaurant(
      {this.id,
      this.name,
      this.image,
      this.location,
      this.longitude,
      this.latitude,
      this.averageRating});

  NearestRestaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    location = json['location'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['location'] = location;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['averageRating'] = averageRating;
    return data;
  }
}
