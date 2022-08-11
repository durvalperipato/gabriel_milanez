import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String name;
  String email;
  String avatarUrl;

  User({
    required this.name,
    required this.email,
    required this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
      avatarUrl: map['avatarUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
