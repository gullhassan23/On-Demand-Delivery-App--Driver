import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel {
  String? id, name, phone, email, password, about, profile,devicetoken;
  DateTime? created, updated;
  GeoPoint? location;
  bool? deleted, google, apple;

  CustomerModel({
    this.devicetoken,
    this.about,
    this.created,
    this.deleted,
    this.email,
    this.id,
    this.location,
    this.name,
    this.password,
    this.phone,
    this.profile,
    this.updated,
    this.apple,
    this.google,
  });

  factory CustomerModel.fromMap(var map) {
    return CustomerModel(
      id: map['id'],
      devicetoken: map['devicetoken'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      password: map['password'],
      created: map['created'].toDate(),
      updated: map['updated'].toDate(),
      deleted: map['deleted'],
      about: map['about'],
      location: map['location'],
      profile: map['profile'],
      google: map['google'],
      apple: map['apple'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id ?? '',
      'devicetoken':devicetoken??"",
      'name': name ?? '',
      'email': email ?? '',
      'phone': phone ?? '',
      'password': password ?? '',
      'created': created ?? DateTime.now(),
      'updated': updated ?? DateTime.now(),
      'deleted': deleted ?? false,
      'about': about ?? '',
      'location': location ?? const GeoPoint(0, 0),
      'profile': profile ?? "",
      'google': google ?? false,
      'apple': apple ?? false,
    };
  }
}
