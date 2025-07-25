class ProfileModel {
  bool? success;
  String? message;
  Data? data;

  ProfileModel({this.success, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? name;
  String? email;
  String? image;
  String? role;
  String? description;
  String? location;
  double? latitude;
  double? longitude;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.image,
    this.role,
    this.description,
    this.location,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    role = json['role'];
    description = json['description'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
