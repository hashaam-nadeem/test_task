import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test_task/controllers/home_controller.dart';
import 'package:test_task/utils/colors.dart';

class CalendarBottomSheet extends StatefulWidget {
  final HomeController c;
  const CalendarBottomSheet({super.key, required this.c});

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  late DateTime _focused;
  late DateTime _selected;

  static final _first = DateTime.utc(2024, 1, 1);
  static final _last  = DateTime.utc(2026, 12, 31);

  @override
  void initState() {
    super.initState();
    _focused  = _clamp(DateTime.now());
    _selected = _clamp(DateTime.now());
  }

  DateTime _clamp(DateTime d) {
    if (d.isBefore(_first)) return _first;
    if (d.isAfter(_last))   return _last;
    return d;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceBg,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 32.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: greyColor.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Select Week',
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600)),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, color: greyColor, size: 20.sp),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          TableCalendar(
            firstDay: _first,
            lastDay: _last,
            focusedDay: _focused,
            selectedDayPredicate: (d) => isSameDay(_selected, d),
            onDaySelected: (selected, focused) {
              setState(() {
                _selected = _clamp(selected);
                _focused  = _clamp(focused);
              });
            },
            onPageChanged: (focused) =>
                setState(() => _focused = _clamp(focused)),
            calendarStyle: CalendarStyle(
              defaultTextStyle:
                  TextStyle(color: whiteColor, fontSize: 13.sp),
              weekendTextStyle:
                  TextStyle(color: whiteColor, fontSize: 13.sp),
              outsideTextStyle:
                  TextStyle(color: greyColor, fontSize: 13.sp),
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: accentGreen, width: 1.5.w),
                color: Colors.transparent,
              ),
              todayTextStyle: TextStyle(
                  color: accentGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp),
              selectedDecoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: accentTeal,
              ),
              selectedTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                  color: whiteColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600),
              leftChevronIcon:
                  Icon(Icons.chevron_left, color: whiteColor, size: 20.sp),
              rightChevronIcon:
                  Icon(Icons.chevron_right, color: whiteColor, size: 20.sp),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: greyColor, fontSize: 12.sp),
              weekendStyle: TextStyle(color: greyColor, fontSize: 12.sp),
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: () {
                final weekNum =
                    ((_selected.difference(DateTime(2024, 12, 1)).inDays) / 7)
                            .floor() +
                        1;
                widget.c.currentWeek.value = 'Week ${weekNum.clamp(1, 4)}/4';
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: accentTeal,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text('Confirm',
                  style: TextStyle(
                      fontSize: 15.sp, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
