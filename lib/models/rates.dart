class RateModel {
  String? id, distance, amount, vehicle, admin, duration;
  DateTime? created;

  RateModel({
    this.admin,
    this.amount,
    this.created,
    this.distance,
    this.duration,
    this.id,
    this.vehicle,
  });

  factory RateModel.fromMap(var map) {
    return RateModel(
      admin: map['admin'],
      amount: map['amount'],
      created: map['created'].toDate(),
      distance: map['distance'],
      duration: map['duration'],
      id: map['id'],
      vehicle: map['vehicle'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'admin': admin ?? '',
      'amount': amount ?? '',
      'created': created ?? DateTime.now(),
      'distance': distance ?? '',
      'duration': duration ?? '',
      'id': id ?? '',
      'vehicle': vehicle ?? '',
    };
  }
}
