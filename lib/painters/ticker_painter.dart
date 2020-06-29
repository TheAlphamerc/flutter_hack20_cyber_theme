import 'package:flutter/material.dart';
import 'dart:math';

class TickerPainter extends CustomPainter {
  final Color activeColor;
  final double strokeWidth;

  TickerPainter(this.activeColor, {this.strokeWidth = 4});
  @override
  void paint(Canvas canvas, Size size) async {
    final radius = size.width / 2;
    canvas.save();
    final tickPaint = new Paint()..color = activeColor;
    canvas.translate(radius, radius);
    drawLine(canvas, tickPaint, radius * 2.3, 10, 5);
    drawLine(canvas, tickPaint, radius * 1.3, 3, 15);
    canvas.restore();
    final base = new Paint()
      ..color = activeColor
      ..strokeWidth = 4;
    // canvas.drawLine(Offset(0,0), Offset(size.width, size.height), base);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void drawLine(
      Canvas canvas, Paint paint, double radius, double length, double width) {
    final angle = 2 * pi / 30;
    for (var i = 0; i < 30; i++) {
      int l = 0;
      if (i % 5 == 0) {
        l = 8;
      }
      paint.strokeWidth = width;
      canvas.drawLine(new Offset(0.0, -radius + l),
          new Offset(0.0, -radius + length), paint);
      canvas.rotate(angle);
    }
  }
}
