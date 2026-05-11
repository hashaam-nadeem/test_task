import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/utils/colors.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: navBg,
        border: Border(top: BorderSide(color: dividerColor, width: 1.h)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: whiteColor,
        unselectedItemColor: greyColor,
        selectedFontSize: 10.sp,
        unselectedFontSize: 10.sp,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Icon(Icons.restaurant_menu_outlined, size: 22.sp),
            ),
            label: 'Nutrition',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Icon(Icons.calendar_today_outlined, size: 22.sp),
            ),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Icon(Icons.sentiment_satisfied_alt_outlined, size: 22.sp),
            ),
            label: 'Mood',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Icon(Icons.person_outline, size: 22.sp),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
