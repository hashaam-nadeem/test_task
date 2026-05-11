import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/utils/colors.dart';

class InsightCard extends StatelessWidget {
  final Widget child;
  const InsightCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: surfaceBg,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: child,
    );
  }
}
