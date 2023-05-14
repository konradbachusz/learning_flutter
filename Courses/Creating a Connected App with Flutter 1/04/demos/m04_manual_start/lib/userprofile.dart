import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'userprofile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserProfile {
  @JsonKey(ignore: true)
  String firstName;
  String lastName;
  int loyaltyPoints;
  int fitnessGoal;
  bool isActive;

  UserProfile() {
    this.isActive = false;
  }

  String toJson() {
    Map<String, dynamic> userMap = _$UserProfileToJson(this);
    var userJson = jsonEncode(userMap);
    return userJson;
  }
}
