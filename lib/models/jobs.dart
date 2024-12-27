// import 'package:cloud_firestore/cloud_firestore.dart';

// class JobModel {
//   String? id,
//       from,
//       title,
//       sender,
//       vehicle,
//       amount,
//       driver,
//       instructions,
//       package,
//       image;
//   bool? marketplace, delivery;
//   DateTime? created, date;
//   Item? item;
//   Pickup? pickup;
//   Dropoff? dropoff;
//   Labor? labor;
//   int? type, number, status;

//   JobModel({
//     this.amount,
//     this.created,
//     this.date,
//     this.delivery,
//     this.driver,
//     this.dropoff,
//     this.from,
//     this.id,
//     this.image,
//     this.instructions,
//     this.item,
//     this.labor,
//     this.marketplace,
//     this.package,
//     this.pickup,
//     this.sender,
//     this.title,
//     this.vehicle,
//     this.type, // 0: live, 1: scheduled
//     this.number,
//     this.status, //0: created/processing, 1: delivered, 2: on-way
//   });

//   factory JobModel.fromMap(var map) {
//     return JobModel(
//       amount: map['amount'],
//       created: map['created'].toDate(),
//       date: map['date'].toDate(),
//       delivery: map['delivery'],
//       driver: map['driver'],
//       dropoff: Dropoff.fromMap(map['dropoff']),
//       from: map['from'],
//       id: map['id'],
//       image: map['image'],
//       instructions: map['instructions'],
//       item: Item.fromMap(map['item']),
//       labor: Labor.fromMap(map['labor']),
//       marketplace: map['marketplace'],
//       package: map['package'],
//       pickup: Pickup.fromMap(map['pickup']),
//       sender: map['sender'],
//       title: map['title'],
//       vehicle: map['vehicle'],
//       type: map['type'],
//       number: map['number'],
//       status: map['status'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'amount': amount ?? '',
//       'created': created ?? DateTime.now(),
//       'date': date ?? DateTime.now(),
//       'delivery': delivery ?? true,
//       'driver': driver ?? '',
//       'dropoff': (dropoff ?? Dropoff()).toMap(),
//       'from': from ?? '',
//       'id': id ?? '',
//       'image': image ?? '',
//       'instructions': instructions ?? '',
//       'item': (item ?? Item()).toMap(),
//       'labor': (labor ?? Labor()).toMap(),
//       'marketplace': marketplace ?? false,
//       'package': package ?? '',
//       'pickup': (pickup ?? Pickup()).toMap(),
//       'sender': sender ?? '',
//       'title': title ?? '',
//       'vehicle': vehicle ?? '',
//       'type': type ?? 0,
//       'number': number ?? FieldValue.increment(1),
//       'status': status ?? 0,
//     };
//   }
// }

// class Labor {
//   String? labor;
//   bool? isRequired;

//   Labor({this.isRequired, this.labor});

//   factory Labor.fromMap(var map) {
//     return Labor(labor: map['labor'], isRequired: map['required']);
//   }

//   Map<String, dynamic> toMap() {
//     return {'labor': labor ?? '', 'required': isRequired ?? false};
//   }
// }

// class Dropoff {
//   String? name, phone, city, address;
//   GeoPoint? point;

//   Dropoff({
//     this.address,
//     this.city,
//     this.name,
//     this.phone,
//     this.point,
//   });

//   factory Dropoff.fromMap(var map) {
//     return Dropoff(
//       address: map['address'],
//       city: map['city'],
//       name: map['name'],
//       phone: map['phone'],
//       point: map['point'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'address': address ?? '',
//       'city': city ?? '',
//       'name': name ?? '',
//       'phone': phone ?? '',
//       'point': point ?? const GeoPoint(0, 0),
//     };
//   }
// }

// class Pickup {
//   String? city, location, miles;
//   GeoPoint? point;

//   Pickup({
//     this.city,
//     this.location,
//     this.miles,
//     this.point,
//   });

//   factory Pickup.fromMap(var map) {
//     return Pickup(
//       city: map['city'],
//       location: map['location'],
//       miles: map['miles'],
//       point: map['point'],
//     );
//   }
//   Map<String, dynamic> toMap() {
//     return {
//       'city': city ?? '',
//       'location': location ?? '',
//       'miles': miles ?? '',
//       'point': point ?? const GeoPoint(0, 0),
//     };
//   }
// }

// class Item {
//   String? name;
//   String? weight, height, width, length;

//   Item({
//     this.name,
//     this.height,
//     this.length,
//     this.weight,
//     this.width,
//   });

//   factory Item.fromMap(var map) {
//     return Item(
//       name: map['name'],
//       height: map['height'],
//       length: map['length'],
//       width: map['width'],
//       weight: map['weight'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name ?? '',
//       'height': height ?? '',
//       'length': length ?? '',
//       'width': width ?? '',
//       'weight': weight ?? '',
//     };
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/models/customers.dart';
import 'package:driverapp/models/drivers.dart';

class JobModel {
  String? id,
      from,
      title,
      sender,
      vehicle,
      amount,
      driver,
      instructions,
      package,
      miles,
      image;
  bool? marketplace, delivery, paymentstatus;
  DateTime? created, date;
  Item? item;
  Pickup? pickup;
  // DriverModel? driverdetail;
  // CustomerModel? customerdetail;

  Dropoff? dropoff;
  Labor? labor;
  int? type, number, status;

  JobModel({
    this.amount,
    this.created,
    this.date,
    // this.driverdetail,
    // this.customerdetail,

    this.delivery,
    this.paymentstatus,
    this.miles,
    this.driver,
    this.dropoff,
    this.from,
    this.id,
    this.image,
    this.instructions,
    this.item,
    this.labor,
    this.marketplace,
    this.package,
    this.pickup,
    this.sender,
    this.title,
    this.vehicle,
    this.type, // 0: live, 1: scheduled
    this.number,
    this.status, //0: created/processing, 1: delivered, 2: on-way
  });

  factory JobModel.fromMap(var map) {
    return JobModel(
      amount: map['amount'],
      miles: map['miles'],
      // driverdetail: DriverModel.fromMap(map['driverdetail']),
      // customerdetail: CustomerModel.fromMap(map['customerdetail']),
      paymentstatus: map['paymentstatus'],

      created: map['created'].toDate(),
      date: map['date'].toDate(),
      delivery: map['delivery'],
      driver: map['driver'],
      dropoff: Dropoff.fromMap(map['dropoff']),
      from: map['from'],
      id: map['id'],
      image: map['image'],
      instructions: map['instructions'],
      item: Item.fromMap(map['item']),
      labor: Labor.fromMap(map['labor']),
      marketplace: map['marketplace'],
      package: map['package'],
      pickup: Pickup.fromMap(map['pickup']),
      sender: map['sender'],
      title: map['title'],
      vehicle: map['vehicle'],
      type: map['type'],
      number: map['number'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'paymentstatus': paymentstatus ?? "",
      'amount': amount ?? '',
      'miles': miles ?? '',
      'created': created ?? DateTime.now(),
      'date': date ?? DateTime.now(),
      'delivery': delivery ?? true,
      'driver': driver ?? '',
      // 'driverdetail': (driverdetail ?? DriverModel()).toMap(),
      // 'customerdetail': (customerdetail ?? CustomerModel()).toMap(),

      'dropoff': (dropoff ?? Dropoff()).toMap(),
      'from': from ?? '',
      'id': id ?? '',
      'image': image ?? '',
      'instructions': instructions ?? '',
      'item': (item ?? Item()).toMap(),
      'labor': (labor ?? Labor()).toMap(),
      'marketplace': marketplace ?? false,
      'package': package ?? '',
      'pickup': (pickup ?? Pickup()).toMap(),
      'sender': sender ?? '',
      'title': title ?? '',
      'vehicle': vehicle ?? '',
      'type': type ?? 0,
      'number': number ?? FieldValue.increment(1),
      'status': status ?? 0,
    };
  }
}

class Labor {
  String? labor;
  bool? isRequired;

  Labor({this.isRequired, this.labor});

  factory Labor.fromMap(var map) {
    return Labor(labor: map['labor'], isRequired: map['required']);
  }

  Map<String, dynamic> toMap() {
    return {'labor': labor ?? '', 'required': isRequired ?? false};
  }
}

class Dropoff {
  String? name, phone, city, address, lat, lng, addressdetail;
  GeoPoint? point;

  Dropoff({
    this.address,
    this.lat,
    this.lng,
    this.addressdetail,
    this.city,
    this.name,
    this.phone,
    this.point,
  });

  factory Dropoff.fromMap(var map) {
    return Dropoff(
      address: map['address'],
      addressdetail: map['addressdetail'],
      city: map['city'],
      lat: map['lat'],
      lng: map['lng'],
      name: map['name'],
      phone: map['phone'],
      point: map['point'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address ?? '',
      'city': city ?? '',
      'name': name ?? '',
      'addressdetail': addressdetail ?? '',
      'lng': lng ?? '',
      'lat': lat ?? '',
      'phone': phone ?? '',
      'point': point ?? const GeoPoint(0, 0),
    };
  }
}

class Pickup {
  String? name, phone, addressdetail, city, location, miles, address, lat, lng;
  GeoPoint? point;

  Pickup({
    this.city,
    this.name,
    this.phone,
    this.addressdetail,
    this.location,
    this.address,
    this.lat,
    this.lng,
    this.miles,
    this.point,
  });

  factory Pickup.fromMap(var map) {
    return Pickup(
      city: map['city'],
      name: map['name'],
      phone: map['phone'],
      addressdetail: map['addressdetail'],
      location: map['location'],
      address: map['address'],
      lat: map['lat'],
      lng: map['lng'],
      miles: map['miles'],
      point: map['point'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'city': city ?? '',
      'location': location ?? '',
      'address': address ?? '',
      'lat': lat ?? '',
      'lng': lng ?? '',
      'name': lng ?? '',
      'phone': lng ?? '',
      'addressdetail': lng ?? '',
      'miles': miles ?? '',
      'point': point ?? const GeoPoint(0, 0),
    };
  }
}

class Item {
  String? name;
  String? weight, height, width, length;

  Item({
    this.name,
    this.height,
    this.length,
    this.weight,
    this.width,
  });

  factory Item.fromMap(var map) {
    return Item(
      name: map['name'],
      height: map['height'],
      length: map['length'],
      width: map['width'],
      weight: map['weight'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name ?? '',
      'height': height ?? '',
      'length': length ?? '',
      'width': width ?? '',
      'weight': weight ?? '',
    };
  }
}
