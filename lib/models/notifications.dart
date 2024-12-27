class AppNotifications {
  String? id, title, subtitle, content, sender;
  int? type;
  bool? read;
  DateTime? send;

  AppNotifications({
    this.content,
    this.id,
    this.read,
    this.send,
    this.sender,
    this.subtitle,
    this.title,
    this.type,
  });

  factory AppNotifications.fromMap(var map) {
    return AppNotifications(
      content: map['content'],
      id: map['id'],
      read: map['read'],
      send: map['send'].toDate(),
      sender: map['sender'],
      subtitle: map['subtiitle'],
      title: map['title'],
      type: map['type'],
    );
  }
}
