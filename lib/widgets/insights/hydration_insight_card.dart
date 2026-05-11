import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/utils/colors.dart';
import 'package:test_task/widgets/insights/insight_card.dart';

class HydrationInsightCard extends StatelessWidget {
  final int percent;
  final int ml;

  const HydrationInsightCard(
      {super.key, required this.percent, required this.ml});

  @override
  Widget build(BuildContext context) {
    final double topFill = (ml / 2000).clamp(0.0, 1.0);
    const double botFill = 0.0;

    return InsightCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$percent%',
                  style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: lightBlue)),
              SizedBox(height: 2.h),
              Text('Hydration',
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: whiteColor,
                      fontWeight: FontWeight.w500)),
              Text('Log Now',
                  style: TextStyle(fontSize: 11.sp, color: greyColor)),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _barRow(label: '2 L', fill: topFill, trailing: ''),
              SizedBox(height: 10.h),
              _barRow(label: '0 L', fill: botFill, trailing: '${ml}ml'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _barRow({
    required String label,
    required double fill,
    required String trailing,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: TextStyle(fontSize: 10.sp, color: greyColor)),
        SizedBox(width: 8.w),
        SizedBox(
          width: 80.w,
          child: Stack(
            children: [
              Container(
                height: 3.h,
                decoration: BoxDecoration(
                  color: dividerColor,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              if (fill > 0)
                FractionallySizedBox(
                  widthFactor: fill,
                  child: Container(
                    height: 3.h,
                    decoration: BoxDecoration(
                      color: accentBlue,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (trailing.isNotEmpty) ...[
          SizedBox(width: 6.w),
          Text(trailing,
              style: TextStyle(fontSize: 10.sp, color: greyColor)),
        ],
      ],
    );
  }
}
