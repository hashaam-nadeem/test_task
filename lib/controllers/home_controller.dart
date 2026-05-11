import 'package:get/get.dart';

class HomeController extends GetxController {
  final calories = 550.obs;
  final caloriesGoal = 2500.obs;
  final caloriesRemaining = 1950.obs;
  final weight = 75.0.obs;
  final weightChange = '+1.6kg'.obs;
  final hydrationPercent = 0.obs;
  final hydrationMl = 0.obs;
  final hydrationGoal = 500.obs;
  final temperature = '9°'.obs;
  final currentWeek = 'Week 1/4'.obs;
  final todayDate = 'Today, 22 Dec 2024'.obs;
  final showWaterToast = false.obs;

  void addWater() {
    hydrationMl.value += 500;
    hydrationPercent.value =
        ((hydrationMl.value / hydrationGoal.value) * 100).round();
    showWaterToast.value = true;
    Future.delayed(const Duration(seconds: 2), () => showWaterToast.value = false);
  }
}
