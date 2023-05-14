import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'userprofile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserProfile {
  String firstName;
  String lastName;
  bool isActive;
  int loyaltyPoints;
  int fitnessGoal;

  UserProfile(this.firstName, this.lastName, this.isActive, this.loyaltyPoints,
      this.fitnessGoal);

  factory UserProfile.fromJson(Map<String, dynamic> userMap) {
    // return UserProfile(
    //   userMap['first_name'],
    //   userMap['last_name'],
    //   userMap['is_active'],
    //   userMap['loyalty_points'],
    //   userMap['fitness_goal'],
    // );
    return _$UserProfileFromJson(userMap);
  }
}
