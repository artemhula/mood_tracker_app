import 'package:flutter/material.dart';
import 'package:mood_tracker/widgets/face_painter.dart';

class FaceWidget extends StatelessWidget {
  const FaceWidget({
    super.key,
    required this.value,
  });
  final double value;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(320, 320),
      painter: FacePainter(value),
    );
  }
}
