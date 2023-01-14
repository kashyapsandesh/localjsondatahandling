import 'dart:convert';

User userfromJson(String str) => User.fromJson(jsonDecode(str));

class User {
  User({this.name, this.age, this.height, this.hobbies});
  String? name;
  int? age;
  double? height;
  List<dynamic>? hobbies;
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
      height: json['height'],
      hobbies: json['hobbies'],
    );
  }
}
