class Exercise {
  String title;
  int reps;

  Exercise(this.title, this.reps);

  factory Exercise.fromJson(Map<String, dynamic> exerciseMap) {
    return Exercise(exerciseMap['title'] as String, exerciseMap['reps'] as int);
  }
}