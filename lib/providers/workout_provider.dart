import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webingo_demo/model/workout_model.dart';
import 'package:webingo_demo/services/workout_service.dart';

final workoutServiceProvider = Provider((ref) {
  return WorkoutService(baseUrl: 'https://fitness.wigian.in');
});

// 👇 Add .family to accept a date string
final workoutProvider = FutureProvider.family<List<WorkoutModel>, String>((ref, date) async {
  final service = ref.watch(workoutServiceProvider);
  return service.fetchWorkoutSessions(date: date);
});
