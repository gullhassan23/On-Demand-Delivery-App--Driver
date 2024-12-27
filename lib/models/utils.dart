class UtilsModel {
  String? id, contact, email;

  UtilsModel({this.id, this.contact, this.email});

  factory UtilsModel.fromMap(var map) {
    return UtilsModel(
      id: map['id'],
      email: map['email'],
      contact: map['contact'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id ?? '',
      'email':email ?? '',
      'contact': contact ?? '',
    };
  }
}
