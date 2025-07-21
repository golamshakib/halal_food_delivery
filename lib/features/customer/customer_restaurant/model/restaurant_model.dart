class RestaurantModel {
  bool? success;
  String? message;
  Data? data;

  RestaurantModel({this.success, this.message, this.data});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Result? result;
  double? averageRating;
  List<OtherRestaurant>? otherRestaurant;

  Data({this.result, this.averageRating, this.otherRestaurant});

  Data.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    averageRating =
        json['averageRating'] is int
            ? (json['averageRating'] as int).toDouble()
            : json['averageRating'] as double?;
    if (json['otherRestaurant'] != null) {
      otherRestaurant = <OtherRestaurant>[];
      json['otherRestaurant'].forEach((v) {
        otherRestaurant!.add(OtherRestaurant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['averageRating'] = averageRating;
    if (otherRestaurant != null) {
      data['otherRestaurant'] =
          otherRestaurant!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? name;
  String? email;
  String? image;
  String? role;
  String? description;
  String? location;
  double? latitude;
  double? longitude;
  List<Food>? food;

  Result({
    this.id,
    this.name,
    this.email,
    this.image,
    this.role,
    this.description,
    this.location,
    this.latitude,
    this.longitude,
    this.food,
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    role = json['role'];
    description = json['description'];
    location = json['location'];
    latitude =
        (json['latitude'] is int)
            ? (json['latitude'] as int).toDouble()
            : json['latitude'] as double?;
    longitude =
        (json['longitude'] is int)
            ? (json['longitude'] as int).toDouble()
            : json['longitude'] as double?;
    if (json['Food'] != null) {
      food = <Food>[];
      json['Food'].forEach((v) {
        food!.add(Food.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['role'] = role;
    data['description'] = description;
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (food != null) {
      data['Food'] = food!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Food {
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

  Food({
    this.id,
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
  });

  Food.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    description = json['description'];
    price =
        json['price'] is double
            ? (json['price'] as double).toInt()
            : json['price'] as int?;
    offerPrice =
        (json['offerPrice'] is double)
            ? (json['offerPrice'] as double).toInt()
            : json['offerPrice'] as int?;
    category = json['category'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['Review'] != null) {
      review = <Review>[];
      json['Review'].forEach((v) {
        review!.add(Review.fromJson(v));
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
  UserDetails? userDetails;

  Review({
    this.id,
    this.userId,
    this.foodId,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.userDetails,
  });

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    foodId = json['foodId'];
    rating =
        (json['rating'] is int)
            ? (json['rating'] as int).toDouble()
            : json['rating'] as double?;
    comment = json['comment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userDetails =
        json['userDetails'] != null
            ? UserDetails.fromJson(json['userDetails'])
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

  UserDetails({
    this.id,
    this.name,
    this.image,
    this.location,
    this.latitude,
    this.longitude,
  });

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    location = json['location'];
    latitude =
        (json['latitude'] is int)
            ? (json['latitude'] as int).toDouble()
            : json['latitude'] as double?;
    longitude =
        (json['longitude'] is int)
            ? (json['longitude'] as int).toDouble()
            : json['longitude'] as double?;
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

class OtherRestaurant {
  String? id;
  String? name;
  String? image;
  String? location;
  double? longitude;
  double? latitude;
  double? averageRating;

  OtherRestaurant({
    this.id,
    this.name,
    this.image,
    this.location,
    this.longitude,
    this.latitude,
    this.averageRating,
  });

  OtherRestaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    location = json['location'];
    longitude =
        (json['longitude'] is int)
            ? (json['longitude'] as int).toDouble()
            : json['longitude'] as double?;
    latitude =
        (json['latitude'] is int)
            ? (json['latitude'] as int).toDouble()
            : json['latitude'] as double?;
    averageRating =
        (json['averageRating'] is int)
            ? (json['averageRating'] as int).toDouble()
            : json['averageRating'] as double?;
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
