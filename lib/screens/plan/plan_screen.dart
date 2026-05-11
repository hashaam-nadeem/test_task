import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/controllers/plan_controller.dart';
import 'package:test_task/screens/plan/day_row.dart';
import 'package:test_task/utils/colors.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(PlanController());

    return Scaffold(
      backgroundColor: appBg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Training Calendar',
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold)),
                  Text('Save',
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(height: 1.5.h, color: accentBlue),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Week 2/8',
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 2.h),
                      Text('December 8-14',
                          style: TextStyle(
                              color: greyColor, fontSize: 13.sp)),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text('Total: 60min',
                        style: TextStyle(color: greyColor, fontSize: 13.sp)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: c.trainingDays.length,
                itemBuilder: (context, index) {
                  final day = c.trainingDays[index];
                  final workouts =
                      day['workouts'] as List<Map<String, dynamic>>;
                  return DayRow(day: day, workouts: workouts);
                },
              ),
            ),
            Container(height: 1.5.h, color: accentTeal),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 14.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Week 2',
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 2.h),
                      Text('December 14-22',
                          style: TextStyle(
                              color: greyColor, fontSize: 13.sp)),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text('Total: 60min',
                        style: TextStyle(color: greyColor, fontSize: 13.sp)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
