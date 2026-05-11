import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: avatarPurple,
                      ),
                      child: Center(
                        child: Text('R',
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text('Ahmad Hassan',
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 4.h),
                    Text('ahmad@example.com',
                        style: TextStyle(
                            color: greyColor, fontSize: 13.sp)),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              _sectionTitle('Personal Info'),
              _infoTile(Icons.person_outline, 'Name', 'Ahmad Hassan'),
              _infoTile(Icons.cake_outlined, 'Age', '25'),
              _infoTile(Icons.height, 'Height', '175 cm'),
              _infoTile(
                  Icons.monitor_weight_outlined, 'Weight', '75 kg'),
              SizedBox(height: 24.h),
              _sectionTitle('Goals'),
              _infoTile(Icons.local_fire_department_outlined,
                  'Daily Calories', '2500 kcal'),
              _infoTile(
                  Icons.water_drop_outlined, 'Daily Water', '2000 ml'),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(title,
          style: TextStyle(
              color: whiteColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: surfaceBg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: greyColor, size: 20.sp),
          SizedBox(width: 12.w),
          Text(label,
              style: TextStyle(color: greyColor, fontSize: 13.sp)),
          const Spacer(),
          Text(value,
              style: TextStyle(
                  color: whiteColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
