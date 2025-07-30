import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webingo_demo/model/workout_model.dart';

class WorkoutService{
  final String baseUrl;

  WorkoutService({required this.baseUrl});

  Future<List<WorkoutModel>> fetchWorkoutSessions({required String date}) async {
    final response = await http.get(Uri.parse('$baseUrl/user_plan_api.php?date=$date'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> jsonList = jsonData['plans'];
      return jsonList.map((json) => WorkoutModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load workout sessions');
    }
  }
}