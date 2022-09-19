part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String);
}

Map<String, dynamic> _$UserToJson(User user) => <String, dynamic>{
      'id': user.id,
      'name': user.name,
      'username': user.username,
      'email': user.email,
      'phone': user.phone,
    };
