import 'package:flutter/material.dart';
import 'package:mood_tracker/color_util.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.percent});

  final int percent;

  @override
  Widget build(BuildContext context) {
    Color moodColor = getColorFromValue(percent).withOpacity(0.4);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      color: moodColor,
      child: const SizedBox.expand(),
    );
  }
}
