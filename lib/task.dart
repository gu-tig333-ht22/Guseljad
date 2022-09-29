class minuppgift {
  String? id;
  late final String title;
  bool done = false;
  int? isDone;
  minuppgift({required this.title, this.id, required this.done, this.isDone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'done': done,
    };
  }

  minuppgift.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        done = json['done'],
        id = json['id'];

  Map<String, dynamic> toJson() =>
      {'title': this.title, 'done': this.done, 'id': this.id};
}
