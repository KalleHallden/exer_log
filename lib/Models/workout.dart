import 'package:cloud_firestore/cloud_firestore.dart';

import 'exercise.dart';

class Workout {

  Workout(
      this.exercises,
      this.notes,
      this.rating,
      this.time,
      this.type,
      this.name,
      this.template,
      this.totalReps,
      this.totalWeight,
      this.totalSets,);

  Workout.fromJson(Map<String, Object?> workout)
      : exercises = workout['exercises']! as List,
        notes = workout['notes']! as String,
        rating = workout['rating']! as String,
        time = workout['time']! as double,
        totalReps = workout['total_reps']! as int,
        totalWeight = workout['total_weight']! as double,
        totalSets = workout['total_sets']! as int,
        name = workout['name']! as String,
        type = workout['type']! as String,
        template = workout['template']! as bool;

  Workout.fromJsonQuery(QueryDocumentSnapshot<Map<String, dynamic>> workout)
      : exercises = workout['exercises']! as List,
        notes = workout['notes']! as String,
        rating = workout['rating']! as String,
        time = workout['time']! as double,
        totalReps = workout['total_reps']! as int,
        totalWeight = workout['total_weight']! as double,
        totalSets = workout['total_sets']! as int,
        name = workout['name']! as String,
        type = workout['type']! as String,
        template = workout['template']! as bool;

  Workout.fromJsonQuerySnapshot(QuerySnapshot<Map<String, dynamic>> workout)
      : exercises = workout.docs.last['exercises']! as List,
        notes = workout.docs.last['notes']! as String,
        date =
            DateTime.parse(workout.docs.last['date']!.toDate().toString()),
        rating = workout.docs.last['rating']! as String,
        time = workout.docs.last['time']! as double,
        totalReps = workout.docs.last['total_reps']! as int,
        totalWeight = workout.docs.last['total_weight']! as double,
        totalSets = workout.docs.last['total_sets']! as int,
        name = workout.docs.last['name']! as String,
        type = workout.docs.last['type']! as String,
        template = workout.docs.last['template']! as bool;

  List exercises;
  String notes;
  String rating;
  double time;
  String type;
  String name;
  bool template;
  DateTime? date;
  String? id;
  int totalReps;
  double totalWeight;
  int totalSets;

  void setWorkoutTotals() {
    for (Exercise exercise in exercises) {
      totalReps += exercise.totalReps;
      totalSets += exercise.totalSets;
      totalWeight += exercise.totalWeight;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'date': FieldValue.serverTimestamp(),
      'exercises': exercises,
      'notes': notes,
      'rating': rating,
      'time': time,
      'type': type,
      'total_reps': totalReps,
      'total_weight': totalWeight,
      'total_sets': totalSets,
      'template': template,
      'name': name
    };
  }
}
