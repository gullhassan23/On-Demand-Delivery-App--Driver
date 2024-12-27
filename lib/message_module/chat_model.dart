class ChatMessageModel {
  String? id;
  String? senderId;
  String? receiverId;
  String? photoUrl;
  String? messageType;
  bool? isMe;
  bool? isMessageRead;
  String? message;
  int? createdAt;

  ChatMessageModel(
      {this.id,
      this.senderId,
      this.receiverId,
      this.createdAt,
      this.message,
      this.isMessageRead,
      this.photoUrl,
      this.messageType});

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      message: json['message'],
      isMessageRead: json['isMessageRead'],
      photoUrl: json['photoUrl'],
      messageType: json['messageType'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['message'] = message;
    data['senderId'] = senderId;
    data['isMessageRead'] = isMessageRead;
    data['receiverId'] = receiverId;
    data['photoUrl'] = photoUrl;
    data['messageType'] = messageType;
    return data;
  }
}
