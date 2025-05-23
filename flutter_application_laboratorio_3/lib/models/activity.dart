class Activity {
  final int? id;
  final String description;

  Activity({this.id, required this.description});

  Map<String, dynamic> toMap() {
    return {'id': id, 'description': description};
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(id: map['id'], description: map['description']);
  }
}
