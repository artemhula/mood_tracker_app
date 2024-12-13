import 'package:flutter/material.dart';
import 'package:mood_tracker/color_util.dart';

class SmileSlider extends StatelessWidget {
  const SmileSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final double value;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    final moodColor = getColorFromValue(value.toInt());
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 10.0,
        thumbColor: moodColor,
        activeTrackColor: moodColor,
        inactiveTrackColor: moodColor.withOpacity(0.7),
        trackShape: const RoundedRectSliderTrackShape(),
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 13.0,
          elevation: 0,
          pressedElevation: 0,
        ),
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Slider(
        value: value,
        min: 0,
        max: 100,
        divisions: 100,
        onChanged: onChanged,
      ),
    );
  }
}
