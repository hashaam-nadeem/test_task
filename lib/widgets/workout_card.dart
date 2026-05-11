import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/utils/colors.dart';

class WorkoutCard extends StatelessWidget {
  final String date;
  final String title;

  const WorkoutCard({super.key, required this.date, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: surfaceBg,
        borderRadius: BorderRadius.circular(12.r),
        border: Border(left: BorderSide(color: accentTeal, width: 3.w)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date,
                    style: TextStyle(fontSize: 11.sp, color: greyColor)),
                SizedBox(height: 4.h),
                Text(title,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: whiteColor,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward, color: whiteColor, size: 18.sp),
        ],
      ),
    );
  }
}
