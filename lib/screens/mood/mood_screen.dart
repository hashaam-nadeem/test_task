import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/controllers/mood_controller.dart';
import 'package:test_task/screens/mood/mood_wheel.dart';
import 'package:test_task/utils/colors.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(MoodController());
    final ringSize = 0.68.sw;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [accentTeal, appBg, appBg, appBg, appBg, appBg, appBg, appBg, appBg],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28.h),
                Text('Mood',
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 8.h),
                Text('Start your day',
                    style: TextStyle(color: whiteColor, fontSize: 13.sp)),
                SizedBox(height: 4.h),
                Text('How are you feeling at the\nMoment?',
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.4)),
                SizedBox(height: 40.h),
                Center(
                  child: Obx(() {
                    final mood = c.currentMood;
                    return MoodWheel(
                      size: ringSize,
                      knobAngle: c.knobAngle.value,
                      emoji: mood.emoji,
                      onAngleChanged: c.updateKnobAngle,
                    );
                  }),
                ),
                SizedBox(height: 24.h),
                Obx(() => Center(
                      child: Text(
                        c.currentMood.label,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: whiteColor,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    child: Text('Continue',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600)),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
