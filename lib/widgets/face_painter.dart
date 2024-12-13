import 'package:flutter/material.dart';

class FacePainter extends CustomPainter {
  final double smileCurvature;

  FacePainter(this.smileCurvature);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final leftEyeCenter = Offset(size.width * 0.42, size.height * 0.43);
    final rightEyeCenter = Offset(size.width * 0.58, size.height * 0.43);
    const eyeRadius = 6.0;

    canvas.drawCircle(leftEyeCenter, eyeRadius, paint);
    canvas.drawCircle(rightEyeCenter, eyeRadius, paint);

    final smilePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;

    final smileHeight = smileCurvature - 50;
    final smileStart =
        Offset(size.width * 0.38, size.height * 0.6 - smileHeight * 0.2);
    final smileEnd =
        Offset(size.width * 0.62, size.height * 0.6 - smileHeight * 0.2);
    final smileControl = Offset(size.width * 0.5 - smileHeight * 0.1,
        size.height * 0.6 + smileHeight * 0.7);

    final smilePath = Path()
      ..moveTo(smileStart.dx, smileStart.dy)
      ..quadraticBezierTo(
        smileControl.dx,
        smileControl.dy,
        smileEnd.dx,
        smileEnd.dy,
      );

    canvas.drawPath(smilePath, smilePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
