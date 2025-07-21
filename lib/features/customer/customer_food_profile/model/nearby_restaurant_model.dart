class NearbyRestaurantModel {
  bool? success;
  String? message;
  List<Data>? data;

  NearbyRestaurantModel({this.success, this.message, this.data});

  NearbyRestaurantModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? image;
  String? location;
  double? longitude;
  double? latitude;
  num? averageRating; // Changed from double? to num?

  Data({
    this.id,
    this.name,
    this.image,
    this.location,
    this.longitude,
    this.latitude,
    this.averageRating,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    location = json['location'];
    longitude = json['longitude']?.toDouble(); // Ensure longitude is double
    latitude = json['latitude']?.toDouble(); // Ensure latitude is double
    averageRating = json['averageRating']; // num? handles both int and double
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
