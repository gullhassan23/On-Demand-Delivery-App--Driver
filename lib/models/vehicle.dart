class VehicleModel {
  String? id, name, duration, amount, admin;
  DateTime? created;

  VehicleModel({
    this.admin,
    this.amount,
    this.created,
    this.duration,
    this.id,
    this.name,
  });

  factory VehicleModel.fromMap(var map) {
    return VehicleModel(
      admin: map['admin'],
      amount: map['amount'],
      created: map['created'].toDate(),
      duration: map['duration'],
      id: map['id'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'admin': admin ??'',
      'amount': amount ??'',
      'created': created ?? DateTime.now(),
      'duration': duration ??'',
      'id': id ??'',
      'name': name ??'',
    };
  }
}
