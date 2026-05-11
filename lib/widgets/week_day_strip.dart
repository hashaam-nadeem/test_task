import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/utils/colors.dart';

class WeekDayStrip extends StatelessWidget {
  final List<Map<String, dynamic>> days;
  final int todayIndex;

  const WeekDayStrip({super.key, required this.days, required this.todayIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (i) {
        final day = days[i];
        final isToday = i == todayIndex;
        return Column(
          children: [
            Text(
              day['label'] as String,
              style: TextStyle(
                fontSize: 11.sp,
                color: isToday ? whiteColor : greyColor,
                fontWeight: isToday ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            SizedBox(height: 6.h),
            Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: isToday
                    ? Border.all(color: accentGreen, width: 1.5.w)
                    : null,
              ),
              child: Center(
                child: Text(
                  '${day['date']}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isToday ? accentGreen : greyColor,
                    fontWeight:
                        isToday ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            if (day['hasDot'] == true)
              Container(
                width: 4.w,
                height: 4.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: accentGreen,
                ),
              )
            else
              SizedBox(height: 4.h),
          ],
        );
      }),
    );
  }
}
