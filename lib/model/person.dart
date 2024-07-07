class Person {
  final int id;
  final String name;
  final String email;
  final int age;
  final String city;

  Person({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.city,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'city': city,
    };
  }

  @override
  String toString() {
    return 'Person{id: $id, name: $name, email: $email, age: $age, city: $city}';
  }
}
