// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userprofile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile()
    ..lastName = json['last_name'] as String
    ..loyaltyPoints = json['loyalty_points'] as int
    ..fitnessGoal = json['fitness_goal'] as int
    ..isActive = json['is_active'] as bool;
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'last_name': instance.lastName,
      'loyalty_points': instance.loyaltyPoints,
      'fitness_goal': instance.fitnessGoal,
      'is_active': instance.isActive,
    };
