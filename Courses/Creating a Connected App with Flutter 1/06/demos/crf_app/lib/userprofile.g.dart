// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userprofile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
    json['first_name'] as String,
    json['last_name'] as String,
    json['is_active'] as bool,
    json['loyalty_points'] as int,
    json['fitness_goal'] as int,
  );
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'is_active': instance.isActive,
      'loyalty_points': instance.loyaltyPoints,
      'fitness_goal': instance.fitnessGoal,
    };
