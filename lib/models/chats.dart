class ChatModel {
  String? id, sender, message;
  bool? support;
  int? status;
  DateTime? created, send;
  List<String>? members;

  ChatModel({
    this.created,
    this.id,
    this.members,
    this.message,
    this.send,
    this.sender,
    this.status,
    this.support,
  });

  factory ChatModel.fromMap(var map) {
    return ChatModel(
      created: map['created'].toDate(),
      id: map['id'],
      members: map['members'].cast<String>().toList(),
      message: map['message'],
      send: map['send'].toDate(),
      sender: map['sender'],
      status: map['status'],
      support: map['support'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created': created ?? DateTime.now(),
      'id': id ?? '',
      'members': members ?? [],
      'message': message ?? '',
      'send': send ?? DateTime.now(),
      'sender': sender ?? '',
      'status': status ?? '',
      'support': support ?? false,
    };
  }
}
