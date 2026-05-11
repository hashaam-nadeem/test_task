import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/controllers/home_controller.dart';
import 'package:test_task/screens/home/calendar_bottom_sheet.dart';
import 'package:test_task/utils/colors.dart';
import 'package:test_task/widgets/insight_cards.dart';
import 'package:test_task/widgets/week_day_strip.dart';
import 'package:test_task/widgets/workout_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());

    final weekDays = [
      {'label': 'M', 'date': 21, 'hasDot': false},
      {'label': 'TU', 'date': 22, 'hasDot': true},
      {'label': 'W', 'date': 23, 'hasDot': false},
      {'label': 'TH', 'date': 24, 'hasDot': false},
      {'label': 'F', 'date': 25, 'hasDot': false},
      {'label': 'SA', 'date': 26, 'hasDot': false},
      {'label': 'SU', 'date': 27, 'hasDot': false},
    ];

    return Scaffold(
      backgroundColor: appBg,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.notifications_none_outlined,
                          color: whiteColor, size: 24.sp),
                      Container(
                        width: 223.w,
                        child: GestureDetector(
                          onTap: () => _showCalendarSheet(context, c),
                          child: Row(
                            children: [
                              Container(
                                width: 20.w,
                                height: 20.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: elevatedBg,
                                ),
                                child: Icon(Icons.sync,
                                    color: subtleGrey, size: 12.sp),
                              ),
                              SizedBox(width: 6.w),
                              Obx(() => Text(c.currentWeek.value,
                                  style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500))),
                              Icon(Icons.keyboard_arrow_down,
                                  color: whiteColor, size: 18.sp),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(c.todayDate.value,
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500))),
                            SizedBox(height: 12.h),
                            WeekDayStrip(days: weekDays, todayIndex: 1),
                          ],
                        ),
                      ),
                      // SizedBox(width: 12.w),
                      
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Workouts',
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(Icons.wb_sunny_outlined,
                              color: whiteColor, size: 16.sp),
                          SizedBox(width: 4.w),
                          Obx(() => Text(c.temperature.value,
                              style: TextStyle(
                                  color: whiteColor, fontSize: 13.sp))),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  const WorkoutCard(
                      date: 'December 22 - 25m - 30m',
                      title: 'Upper Body'),
                  SizedBox(height: 24.h),
                  Text('My Insights',
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 12.h),
                  Obx(() => Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: CaloriesInsightCard(
                              calories: c.calories.value,
                              remaining: c.caloriesRemaining.value,
                              goal: c.caloriesGoal.value,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 130.h,
                              child: WeightInsightCard(
                                weight: c.weight.value,
                                change: c.weightChange.value,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 12.h),
                  Obx(() => HydrationInsightCard(
                        percent: c.hydrationPercent.value,
                        ml: c.hydrationMl.value,
                      )),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
            Obx(() => c.showWaterToast.value
                ? Positioned(
                    bottom: 20.h,
                    left: 20.w,
                    right: 20.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: toastBg,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        '500 ml added to water log',
                        style: TextStyle(
                            color: whiteColor, fontSize: 13.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : const SizedBox()),
          ],
        ),
      ),
    );
  }

  void _showCalendarSheet(BuildContext context, HomeController c) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => CalendarBottomSheet(c: c),
    );
  }

  Widget _avatar(String letter, Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: Text(letter,
            style: TextStyle(
                color: whiteColor,
                fontSize: size * 0.38,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
