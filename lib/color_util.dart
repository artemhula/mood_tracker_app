import 'package:flutter/material.dart';

Color getColorFromValue(int value) {
  value = value.clamp(0, 100);

  List<int> stops = [0, 25, 50, 75, 100];
  List<Color> colors = [
    Colors.blue,
    Colors.cyan,
    Colors.grey,
    Colors.lime,
    Colors.orange,
  ];

  for (int i = 0; i < stops.length - 1; i++) {
    if (value >= stops[i] && value <= stops[i + 1]) {
      double t = (value - stops[i]) / (stops[i + 1] - stops[i]);
      return Color.lerp(colors[i], colors[i + 1], t)!;
    }
  }

  return colors.last;
}
