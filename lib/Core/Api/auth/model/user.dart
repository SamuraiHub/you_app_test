import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'username')
  String username;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'password')
  String password;

  User({required this.username, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}