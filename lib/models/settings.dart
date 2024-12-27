class SettingModel {
  String? id, token;
  DateTime? created, updated;
  bool? notifications;

  SettingModel({
    this.created,
    this.id,
    this.notifications,
    this.token,
    this.updated,
  });

  factory SettingModel.fromMap(var map) {
    return SettingModel(
      id: map['id'],
      notifications: map['notifications'],
      token: map['token'],
      updated: map['updated'].toDate(),
      created: map['created'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id ??'',
      'notifications': notifications ?? true,
      'token': token ?? '',
      'updated' : updated ?? DateTime.now(),
      'created': created ?? DateTime.now(),
    };
  }
}
