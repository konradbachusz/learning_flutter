import 'dart:convert';

class UserProfile {
  String firstName;
  String lastName;
  bool isActive;
  int loyaltyPoints;
  int fitnessGoal;

  UserProfile();

  String toJson() {
    Map<String, dynamic> userMap = {
      'first_name': this.firstName,
      'last_name': this.lastName,
      'is_active': this.isActive,
      'loyalty_points': this.loyaltyPoints,
      'fitness_goal': this.fitnessGoal
    };
    return jsonEncode(userMap);
  }
}
