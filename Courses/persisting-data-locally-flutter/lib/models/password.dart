class Password {
  int? id;
  late String name;
  late String password;

  Password(this.name, this.password);

  Password.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    password = map['password'];
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'password': password};
  }


}
