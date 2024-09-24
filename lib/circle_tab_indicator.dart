import 'package:flutter/material.dart';

class CircleTabIndicator extends Decoration {
  final double radius;
  final Color color;
  final double glowRadius;
  final Color glowColor;

  const CircleTabIndicator({
    this.radius = 4.0,
    this.color = Colors.blue,
    this.glowRadius = 8.0,
    this.glowColor = const Color.fromARGB(75, 255, 255, 255),
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter(
      radius: radius,
      color: color,
      glowRadius: glowRadius,
      glowColor: glowColor,
    );
  }
}

class _DotPainter extends BoxPainter {
  final double radius;
  final Color color;
  final double glowRadius;
  final Color glowColor;

  _DotPainter({
    required this.radius,
    required this.color,
    required this.glowRadius,
    required this.glowColor,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // Calculate the center position
    final Offset center = offset +
        Offset(configuration.size!.width / 2,
            configuration.size!.height - radius - 4);

    // Draw the glow
    final Paint glowPaint = Paint()
      ..color = glowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowRadius);

    canvas.drawCircle(center, radius + glowRadius, glowPaint);

    // Draw the main dot
    final Paint dotPaint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, radius / 4);

    canvas.drawCircle(center, radius, dotPaint);
  }
}
