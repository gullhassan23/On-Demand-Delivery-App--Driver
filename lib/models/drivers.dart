import 'package:cloud_firestore/cloud_firestore.dart';

import 'assets.dart';

class DriverModel {
  String? id, name, phone, email, password, about, profile, devicetoken,address;
  DateTime? created, updated;
  GeoPoint? location;
  var wallet;
  bool? deleted;
  bool? approved, status;
  String? radius;
  Assets? asset;

  DriverModel({
    this.address,
    this.asset,
    this.about,
    this.devicetoken,
    this.created,
    this.deleted,
    this.wallet,
    this.email,
    this.id,
    this.location,
    this.name,
    this.password,
    this.phone,
    this.profile,
    this.updated,
    this.approved,
    this.status,
    this.radius,
  });

  // factory DriverModel.fromMap(var map) {
  //   return DriverModel(
  //     id: map['id'],
  //     name: map['name'],
  //     email: map['email'],
  //     phone: map['phone'],
  //     password: map['password'],
  //     created: map['created'].toDate(),
  //     updated: map['updated'].toDate(),
  //     deleted: map['deleted'],
  //     about: map['about'],
  //     radius: map['radius'],
  //     status: map['status'],
  //     approved: map['approved'],

  //     location: map['location'],
  //     profile: map['profile'],
  //   );
  // }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      address:map!['address'],
      id: map!['id'],
      asset:  map['asset'] != null ? Assets.fromMap(map['asset']) : null,
      devicetoken: map['devicetoken'],
      name: map['name'],
      wallet: map['wallet'],
      email: map['email'],
      phone: map['phone'],
      password: map['password'],
      created: (map['created'] as Timestamp?)?.toDate(),
      updated: (map['updated'] as Timestamp?)?.toDate(),
      deleted: map['deleted'],
      about: map['about'],
      radius: map['radius'],
      status: map['status'],
      approved: map['approved'],
      location: map['location'] as GeoPoint?,
      profile: map['profile'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id ?? '',
      'address':address??"",
      'asset': (asset ?? Assets()).toMap(),
      'devicetoken': devicetoken ?? "",
      'name': name ?? '',
      'email': email ?? '',
      'wallet':wallet??"",
      'phone': phone ?? '',
      'password': password ?? '',
      'created': created ?? DateTime.now(),
      'updated': updated ?? DateTime.now(),
      'deleted': deleted ?? false,
      'about': about ?? '',
      'status': status ?? false,
      'approved': approved ?? false,
      'radius': radius ?? '5',
      'location': location ?? const GeoPoint(0, 0),
      'profile': profile ?? "",
    };
  }
}
