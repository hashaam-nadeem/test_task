import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/utils/colors.dart';

class DayRow extends StatelessWidget {
  final Map<String, dynamic> day;
  final List<Map<String, dynamic>> workouts;

  const DayRow({super.key, required this.day, required this.workouts});

  @override
  Widget build(BuildContext context) {
    final bool hasWorkout = workouts.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: dividerColor.withValues(alpha: 0.7), width: 0.8.h),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 52.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(day['day'] as String,
                    style: TextStyle(
                        color: hasWorkout ? whiteColor : greyColor,
                        fontSize: 13.sp,
                        fontWeight: hasWorkout
                            ? FontWeight.w600
                            : FontWeight.normal)),
                SizedBox(height: 1.h),
                Text('${day['date']}',
                    style: TextStyle(
                        color: hasWorkout ? whiteColor : greyColor,
                        fontSize: 28.sp,
                        fontWeight: hasWorkout
                            ? FontWeight.bold
                            : FontWeight.w300,
                        height: 1.1)),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          if (hasWorkout)
            Expanded(
              child: Column(
                children: workouts.map((w) {
                  final tag = w['tag'] as String;
                  final isLeg = tag.toLowerCase().contains('leg');

                  final Color pillBg = isLeg
                      ? const Color(0xff2D2060)
                      : const Color(0xff0D3D2A);
                  final Color pillText =
                      isLeg ? const Color(0xff9B8FE8) : accentTeal;
                  final IconData pillIcon =
                      isLeg ? Icons.directions_run : Icons.fitness_center;

                  return Container(
                    margin: EdgeInsets.only(bottom: 4.h),
                    decoration: BoxDecoration(
                      color: elevatedBg,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border(
                        left: BorderSide(
                          color: whiteColor.withValues(alpha: 0.45),
                          width: 2.5.w,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(10.w, 8.h, 12.w, 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.drag_indicator,
                                color: greyColor, size: 14.sp),
                            SizedBox(width: 6.w),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 3.h),
                              decoration: BoxDecoration(
                                color: pillBg,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(pillIcon,
                                      color: pillText, size: 11.sp),
                                  SizedBox(width: 4.w),
                                  Text(tag,
                                      style: TextStyle(
                                          color: pillText,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(w['name'] as String,
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500)),
                            Text(w['duration'] as String,
                                style: TextStyle(
                                    color: greyColor, fontSize: 13.sp)),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
          else
            const Spacer(),
        ],
      ),
    );
  }
}
