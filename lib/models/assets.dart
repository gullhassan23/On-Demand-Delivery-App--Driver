import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/models/vehicle.dart';

class Assets {
  String?  name, make, model, trailerType, size;

  DateTime? created;
  VehicleModel? vehiclecategory;
  Image? cnic_front, cnic_back, driving_license_front, driving_license_back;
  Assets(
      {
      this.name,
      this.make,
      this.model,
      this.trailerType,
      this.size,
      this.created,
      this.vehiclecategory,
      this.cnic_back,
      this.cnic_front,
      this.driving_license_back,
      this.driving_license_front});

  factory Assets.fromMap(Map<String, dynamic> map) {
    return Assets(
      vehiclecategory: VehicleModel.fromMap(map['vehiclecategory']),
      name: map['name'],
      cnic_back: Image.fromJson(map['cnic_back']),
      cnic_front: Image.fromJson(map['cnic_front']),
      driving_license_back: Image.fromJson(map['driving_license_back']),
      driving_license_front: Image.fromJson(map['driving_license_front']),
      make: map['make'],
      model: map['model'],
      trailerType: map['trailerType'],
      size: map['size'],
      created: (map['created'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name ?? '',
      'make': make ?? '',
      'vehiclecategory': (vehiclecategory ?? VehicleModel()).toMap(),
      'model': model ?? '',
      'cnic_back': (cnic_back ?? Image()).toJson(),
      'cnic_front': (cnic_front ?? Image()).toJson(),
      'driving_license_back': (driving_license_back ?? Image()).toJson(),
      'driving_license_front': (driving_license_front ?? Image()).toJson(),
      'trailerType': trailerType ?? '',
      'size': size ?? '',
      'created': created ?? DateTime.now(),
    };
  }
}

class Image {
  String? url;
  bool? status;

  Image({
    this.url,
    this.status,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      url: json['url'] ?? '',
      status: json['status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'status': status ?? false,
    };
  }
}
