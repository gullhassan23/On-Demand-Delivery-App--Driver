class AdminModel {
  String? id, name, email, password, picture;
  bool? deleted;
  DateTime? created, updated;

  AdminModel({
    this.created,
    this.deleted,
    this.email,
    this.id,
    this.name,
    this.password,
    this.picture,
    this.updated,
  });

  factory AdminModel.fromMap(var map) {
    return AdminModel(
      id: map['id'],
      created: map['created'].toDate(),
      deleted: map['deleted'],
      email: map['email'],
      name: map['name'],
      password: map['password'],
      picture: map['picture'],
      updated: map['updated'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created': created ?? DateTime.now(),
      'deleted': deleted ?? false,
      'email': email ?? '',
      'id': id ?? '',
      'name': name ?? '',
      'password': password ?? '',
      'picture': picture ?? '',
      'updated': updated ?? DateTime.now(),
    };
  }
}
