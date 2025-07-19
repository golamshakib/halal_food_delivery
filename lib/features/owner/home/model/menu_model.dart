class MenuModel {
  bool? success;
  String? message;
  List<Data>? data;

  MenuModel({this.success, this.message, this.data});

  MenuModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
  int? price;
  int? offerPrice;
  String? category;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<Review>? review;
  int? averageRating;

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
    price = json['price'];
    offerPrice = json['offerPrice'];
    category = json['category'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['Review'] != null) {
      review = [];
      json['Review'].forEach((v) {
        review!.add(Review.fromJson(v));
      });
    }
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
}

class Review {
  String? id;
  String? userId;
  String? comment;
  int? rating;
  String? createdAt;

  Review({this.id, this.userId, this.comment, this.rating, this.createdAt});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    comment = json['comment'];
    rating = json['rating'];
    createdAt = json['createdAt'];
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
