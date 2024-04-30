import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'birthday')
  String? birthday;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'weight')
  int? weight;
  @JsonKey(name: 'interests')
  List<String>? interests;

  Profile({this.username, this.name, this.email, this.birthday, this.height, this.weight, this.interests});

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}