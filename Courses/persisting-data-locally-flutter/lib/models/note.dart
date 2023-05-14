class Note {
  int? id;
  late String name;
  late String date;
  late String notes;
  late int position;

  Note(this.name, this.date, this.notes, this.position);

  Note.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    date = map['date'];
    notes = map['notes'];
    position = map['position'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'notes': notes,
      'position': position,
    };
  }
}
