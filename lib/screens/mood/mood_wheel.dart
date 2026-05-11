import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/utils/colors.dart';

class MoodWheel extends StatelessWidget {
  final double size;
  final double knobAngle;
  final String emoji;
  final ValueChanged<double> onAngleChanged;

  const MoodWheel({
    super.key,
    required this.size,
    required this.knobAngle,
    required this.emoji,
    required this.onAngleChanged,
  });

  Offset _knobOffset(double radius) {
    final a = knobAngle - pi / 2;
    return Offset(
      size / 2 + radius * cos(a),
      size / 2 + radius * sin(a),
    );
  }

  void _handlePan(Offset localPos) {
    final center = Offset(size / 2, size / 2);
    final delta = localPos - center;
    double angle = atan2(delta.dy, delta.dx) + pi / 2;
    if (angle < 0) angle += 2 * pi;
    onAngleChanged(angle);
  }

  @override
  Widget build(BuildContext context) {
    final ringRadius = size / 2 - size * 0.075;
    final knobPos = _knobOffset(ringRadius);
    final knobSize = 26.w;
    final faceSize = size * 0.52;

    return GestureDetector(
      onPanUpdate: (d) => _handlePan(d.localPosition),
      onTapDown: (d) => _handlePan(d.localPosition),
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size, size),
              painter: MoodRingPainter(strokeFraction: 0.075),
            ),
            Positioned(
              left: size / 2 - faceSize / 2,
              top: size / 2 - faceSize / 2,
              child: Container(
                width: faceSize,
                height: faceSize,
                decoration: BoxDecoration(
                  color: const Color(0xffE8B84B),
                  borderRadius: BorderRadius.circular(faceSize * 0.28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 20,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    emoji,
                    style: TextStyle(fontSize: faceSize * 0.42),
                  ),
                ),
              ),
            ),
            Positioned(
              left: knobPos.dx - knobSize / 2,
              top: knobPos.dy - knobSize / 2,
              child: Container(
                width: knobSize,
                height: knobSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffD1D5DB),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 6,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoodRingPainter extends CustomPainter {
  final double strokeFraction;
  const MoodRingPainter({required this.strokeFraction});

  static const List<Color> _colors = [
    moodRed,
    moodOrange,
    moodYellow,
    moodGreen,
    moodTeal,
    moodSky,
    moodLavender,
    moodPink,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final strokeWidth = size.width * strokeFraction;
    final radius = size.width / 2 - strokeWidth / 2 - 2;
    final sweepAngle = (2 * pi) / _colors.length;
    final gap = sweepAngle * 0.12;

    for (int i = 0; i < _colors.length; i++) {
      final paint = Paint()
        ..color = _colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2 + sweepAngle * i + gap / 2,
        sweepAngle - gap,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant MoodRingPainter old) =>
      old.strokeFraction != strokeFraction;
}
