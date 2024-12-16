import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_tracker/color_util.dart';

class Percentage extends StatelessWidget {
  const Percentage({
    super.key,
    required this.value,
  });
  final int value;

  @override
  Widget build(BuildContext context) {
    final color = getColorFromValue(value);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          value.toString(),
          style: GoogleFonts.onest(
            fontSize: 120,
            fontWeight: FontWeight.w300,
            color: color,
          ),
        ),
        Text(
          '%',
          style: GoogleFonts.onest(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            color: color,
          ),
        ),
      ],
    );
  }
}
