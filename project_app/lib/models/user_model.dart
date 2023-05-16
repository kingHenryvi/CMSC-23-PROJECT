import 'dart:convert';

class User {
  final String email;
  String? id;
  String name;
  String username;
  String college;
  String course;
  String studentNum;

  User({
    required this.email,
    this.id,
    required this.name,
    required this.username,
    required this.college,
    required this.course,
    required this.studentNum,
  });

  // Factory constructor to instantiate object from json format
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      id: json['id'],
      name: json['name'],
      username: json['username'],
      college: json['college'],
      course: json['course'],
      studentNum: json['studentNum'],
    );
  }

  static List<User> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<User>((dynamic d) => User.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(User user) {
    return {
      'email': user.email,
      'name': user.name,
      'username': user.username,
      'college': user.college,
      'course': user.course,
      'studentNum': user.studentNum
    };
  }
}
