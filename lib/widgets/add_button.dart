import 'package:flutter/material.dart';
import 'package:mood_tracker/color_util.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.value,
    required this.icon,
    required this.onTap,
  });
  final int value;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = getColorFromValue(value);
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: color,
        child: Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
