import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/utils/colors.dart';
import 'package:test_task/widgets/insights/insight_card.dart';

class CaloriesInsightCard extends StatelessWidget {
  final int calories;
  final int remaining;
  final int goal;

  const CaloriesInsightCard({
    super.key,
    required this.calories,
    required this.remaining,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return InsightCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$calories',
                  style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                ),
                TextSpan(
                  text: ' Calories',
                  style: TextStyle(fontSize: 12.sp, color: greyColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Text('$remaining Remaining',
              style: TextStyle(fontSize: 11.sp, color: greyColor)),
          SizedBox(height: 10.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: (goal - remaining) / goal,
              backgroundColor: dividerColor,
              valueColor: const AlwaysStoppedAnimation<Color>(accentTeal),
              minHeight: 4.h,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0', style: TextStyle(fontSize: 10.sp, color: greyColor)),
              Text('$goal',
                  style: TextStyle(fontSize: 10.sp, color: greyColor)),
            ],
          ),
        ],
      ),
    );
  }
}
