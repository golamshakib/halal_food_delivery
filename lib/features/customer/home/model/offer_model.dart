class OfferModel {
  bool? success;
  String? message;
  List<Data>? data;

  OfferModel({this.success, this.message, this.data});

  OfferModel.fromJson(Map<String, dynamic> json) {
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
  num? price;
  num? offerPrice;
  String? category;
  String? image;
  num? averageRating; // Changed from int? to num?
  String? createdAt;
  String? updatedAt;
  List<Review>? review;

  Data({
    this.id,
    this.userId,
    this.name,
    this.description,
    this.price,
    this.offerPrice,
    this.category,
    this.image,
    this.averageRating,
    this.createdAt,
    this.updatedAt,
    this.review,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    userId = json['userId']?.toString();
    name = json['name']?.toString();
    description = json['description']?.toString();
    price = json['price'] is num ? json['price'] : null;
    offerPrice = json['offerPrice'] is num ? json['offerPrice'] : null;
    category = json['category']?.toString();
    image = json['image']?.toString();
    averageRating =
        json['averageRating'] is num
            ? json['averageRating']
            : null; // Changed to handle num
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    if (json['Review'] != null) {
      review = [];
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
    data['averageRating'] = averageRating;
    data['createdAt'] = createdAt;
    if (review != null) {
      data['Review'] = review!.map((v) => v.toJson()).toList();
    }
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Review {
  String? id;
  String? userId;
  String? comment;
  num? rating; // Changed from int? to num?
  String? createdAt;

  Review({this.id, this.userId, this.comment, this.rating, this.createdAt});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    userId = json['userId']?.toString();
    comment = json['comment']?.toString();
    rating =
        json['rating'] is num ? json['rating'] : null; // Changed to handle num
    createdAt = json['createdAt']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['userId'] = userId;
    data['comment'] = comment;
    data['rating'] = rating;
    data['createdAt'] = createdAt;
    return data;
  }
}
