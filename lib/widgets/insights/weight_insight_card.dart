import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/utils/colors.dart';
import 'package:test_task/widgets/insights/insight_card.dart';

class WeightInsightCard extends StatelessWidget {
  final double weight;
  final String change;

  const WeightInsightCard(
      {super.key, required this.weight, required this.change});

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
                  text: '${weight.toInt()}',
                  style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                ),
                TextSpan(
                  text: ' kg',
                  style: TextStyle(fontSize: 12.sp, color: greyColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Container(
                width: 8.w,
                height: 8.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: accentGreen),
              ),
              SizedBox(width: 4.w),
              Text(change,
                  style: TextStyle(fontSize: 11.sp, color: accentGreen)),
            ],
          ),
          const Spacer(),
          Text('Weight',
              style: TextStyle(
                  fontSize: 13.sp,
                  color: whiteColor,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
