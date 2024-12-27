class FaqModel {
  String? id, question, answer, admin;
  DateTime? created;

  FaqModel({
    this.id,
    this.question,
    this.admin,
    this.answer,
    this.created,
  });

  factory FaqModel.fromMap(var map) {
    return FaqModel(
      id: map['id'],
      question: map['question'],
      admin: map['admin'],
      answer: map['answer'],
      created: map['created'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id ?? '',
      'question': question ?? '',
      'admin': admin ?? '',
      'answer': answer ?? '',
      'created': created ?? DateTime.now(),
    };
  }
}
