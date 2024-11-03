// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String email;
  DateTime birthday;
  String photoURL;
  String description;
  String city;
  int age;

  User({
    required this.id,
    required this.email,
    required this.birthday,
    required this.photoURL,
    required this.description,
    required this.city,
    required this.age,
  });

  User copyWith({
    int? id,
    String? email,
    DateTime? birthday,
    String? photoURL,
    String? description,
    String? city,
    int? age,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      birthday: birthday ?? this.birthday,
      photoURL: photoURL ?? this.photoURL,
      description: description ?? this.description,
      city: city ?? this.city,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'birthday': birthday.millisecondsSinceEpoch,
      'photoURL': photoURL,
      'description': description,
      'city': city,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      email: map['email'] as String,
      birthday: DateTime.fromMillisecondsSinceEpoch(map['birthday'] as int),
      photoURL: map['photoURL'] as String,
      description: map['description'] as String,
      city: map['city'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, email: $email, birthday: $birthday, photoURL: $photoURL, description: $description, city: $city, age: $age)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.birthday == birthday &&
        other.photoURL == photoURL &&
        other.description == description &&
        other.city == city &&
        other.age == age;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        birthday.hashCode ^
        photoURL.hashCode ^
        description.hashCode ^
        city.hashCode ^
        age.hashCode;
  }
}
