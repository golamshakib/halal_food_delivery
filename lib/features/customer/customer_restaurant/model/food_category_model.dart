class FoodCategoryModel {
  bool? success;
  String? message;
  List<Data>? data;

  FoodCategoryModel({this.success, this.message, this.data});

  FoodCategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? name;
  String? description;
  double? price; // Changed to double? to handle both int and double
  double? offerPrice; // Changed to double? to handle both int and double
  String? category;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<Review>? review;
  double? averageRating; // Changed to double? to handle both int and double

  Data({
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
    this.averageRating,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    description = json['description'];
    price = _toDouble(json['price']); // Use helper to convert int or double
    offerPrice = _toDouble(
      json['offerPrice'],
    ); // Use helper to convert int or double
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
    averageRating = _toDouble(
      json['averageRating'],
    ); // Use helper to convert int or double
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
    data['averageRating'] = averageRating;
    return data;
  }

  // Helper function to convert int or double to double?
  double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    return null; // Handle unexpected types
  }
}

class Review {
  String? id;
  String? userId;
  String? foodId;
  double? rating; // Changed to double? to handle both int and double
  String? comment;
  String? createdAt;
  String? updatedAt;

  Review({
    this.id,
    this.userId,
    this.foodId,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    foodId = json['foodId'];
    rating = _toDouble(json['rating']); // Use helper to convert int or double
    comment = json['comment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    return data;
  }

  // Helper function to convert int or double to double?
  double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    return null; // Handle unexpected types
  }
}
