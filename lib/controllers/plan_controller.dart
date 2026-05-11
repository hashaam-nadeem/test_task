import 'package:get/get.dart';

class PlanController extends GetxController {
  final List<Map<String, dynamic>> trainingDays = [
    {
      'day': 'Mon',
      'date': 8,
      'workouts': <Map<String, dynamic>>[
        {'tag': 'Arms Workout', 'name': 'Arm Blaster', 'duration': '25m - 30m'}
      ]
    },
    {
      'day': 'Tue',
      'date': 9,
      'workouts': <Map<String, dynamic>>[]
    },
    {
      'day': 'Wed',
      'date': 10,
      'workouts': <Map<String, dynamic>>[]
    },
    {
      'day': 'Thu',
      'date': 11,
      'workouts': <Map<String, dynamic>>[
        {'tag': 'Leg Workout', 'name': 'Leg Day Blitz', 'duration': '25m - 30m'}
      ]
    },
    {
      'day': 'Fri',
      'date': 12,
      'workouts': <Map<String, dynamic>>[]
    },
    {
      'day': 'Sat',
      'date': 13,
      'workouts': <Map<String, dynamic>>[]
    },
    {
      'day': 'Sun',
      'date': 14,
      'workouts': <Map<String, dynamic>>[]
    },
  ];
}
