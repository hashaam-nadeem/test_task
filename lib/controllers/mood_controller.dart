import 'dart:math';
import 'package:get/get.dart';
import 'package:test_task/models/mood_entry.dart';

class MoodController extends GetxController {
  static const List<MoodEntry> moods = [
    MoodEntry(label: 'Energetic', emoji: '😤', angle: 0.0),
    MoodEntry(label: 'Happy',     emoji: '😄', angle: 0.785),
    MoodEntry(label: 'Content',   emoji: '😄', angle: 1.571),
    MoodEntry(label: 'Calm',      emoji: '☺️', angle: 2.356),
    MoodEntry(label: 'Peaceful',  emoji: '😌', angle: 3.142),
    MoodEntry(label: 'Sad',       emoji: '😔', angle: 3.927),
    MoodEntry(label: 'Anxious',   emoji: '😟', angle: 4.712),
    MoodEntry(label: 'Stressed',  emoji: '😣', angle: 5.498),
  ];

  final knobAngle = (3 * pi / 4).obs;

  MoodEntry get currentMood {
    double best = double.infinity;
    MoodEntry result = moods[0];
    for (final m in moods) {
      final diff = _angleDiff(knobAngle.value, m.angle);
      if (diff < best) {
        best = diff;
        result = m;
      }
    }
    return result;
  }

  void updateKnobAngle(double angle) => knobAngle.value = angle;

  static double _angleDiff(double a, double b) {
    double d = (a - b).abs() % (2 * pi);
    return d > pi ? 2 * pi - d : d;
  }
}
