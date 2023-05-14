class Note {
  int id;
  String name;
  String date;
  String notes;
  int position;

  Note(this.name, this.date, this.notes, this.position); 

  Map<String, dynamic> toMap() { 
    return { 
      'id': id, 
      'name': name, 
      'date': date, 
      'notes': notes, 
      'position': position 
    }; 
  } 
  Note.fromMap(Map<String, dynamic> map) { 
    id = map['id']; 
    name = map['name']; 
    date = map['date']; 
    notes = map['notes']; 
    position = map['position']; 
  } 
}

