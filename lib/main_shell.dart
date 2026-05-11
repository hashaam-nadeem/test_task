import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/controllers/nav_controller.dart';
import 'package:test_task/screens/home/home_screen.dart';
import 'package:test_task/screens/mood/mood_screen.dart';
import 'package:test_task/screens/plan/plan_screen.dart';
import 'package:test_task/screens/profile/profile_screen.dart';
import 'package:test_task/utils/colors.dart';
import 'package:test_task/widgets/app_bottom_navbar.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  static const _pages = [
    HomeScreen(),
    PlanScreen(),
    MoodScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = Get.put(NavController());
    return Obx(() => Scaffold(
          backgroundColor: appBg,
          body: IndexedStack(
            index: nav.currentIndex.value,
            children: _pages,
          ),
          bottomNavigationBar: AppBottomNavBar(
            currentIndex: nav.currentIndex.value,
            onTap: nav.changePage,
          ),
        ));
  }
}
