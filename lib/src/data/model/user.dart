import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable()
class User{
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}