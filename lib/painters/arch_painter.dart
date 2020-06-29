import 'dart:math';

import 'package:flutter/material.dart';

class ArcPainer extends CustomPainter {
  final Color activeColor;
  final double strokeWidth;

  ArcPainer(this.activeColor,
      {this.strokeWidth = 4});
  @override
  void paint(Canvas canvas, Size size) async {
    final radius = size.width / 2;
    canvas.save();
    
    final tickPaint = new Paint()..color = activeColor;
    canvas.translate(radius, radius);
   
    // drawLine(canvas, tickPaint, radius * 2.3, 5, 10);
    drawLine(canvas, tickPaint, radius * 1.3, 2, 15);
    canvas.restore();

    Paint active = new Paint()
      ..color = activeColor
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Paint inActive = new Paint()
      ..color = activeColor.withOpacity(.5)
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    var center1 = Offset(size.width / 2, size.height / 2);
    drawArc(canvas, center1, 40, 100, active, radius: 55);
    drawArc(canvas, center1, 160, 100, active, radius: 55);
    drawArc(canvas, center1, 280, 100, active, radius: 55);

    // drawArc(canvas, center1, 20, 100, inActive, radius: 120, rotate: 60);
    // drawArc(canvas, center1, 140, 100, inActive, radius: 120, rotate: 60);
    // drawArc(canvas, center1, 260, 100, inActive, radius: 120, rotate: 60);

    drawArc(canvas, center1, -40, 100, active, radius: 140, rotate: 60);
    drawArc(canvas, center1, 80, 100, active, radius: 140, rotate: 60);
    drawArc(canvas, center1, 200, 100, active, radius: 140, rotate: 80);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void drawArc(
      Canvas canvas, Offset center, double start, double sweep, Paint paint,
      {double radius = 0, double rotate = 0}) {
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -90 + start * pi / 180, sweep * pi / 180, false, paint);
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

class AntiArcPainer extends CustomPainter {
  final Color activeColor;
  final double strokeWidth;

  AntiArcPainer( this.activeColor, 
      {this.strokeWidth = 4});
  @override
  void paint(Canvas canvas, Size size) async {
    final angle = 2 * pi / 30;
    final radius = size.width / 2;
    canvas.save();

    final double tickLength = 8.0;
    final double tickWidth = 4.0;
    final tickPaint = new Paint()..color = activeColor;
    canvas.translate(radius, radius);
    for (var i = 0; i < 30; i++) {
      int l = 0;
      if (i % 5 == 0) {
        l = 8;
      }
      tickPaint.strokeWidth = tickWidth;
      canvas.drawLine(new Offset(0.0, -radius + l),
          new Offset(0.0, -radius + tickLength), tickPaint);
      canvas.rotate(angle);
    }
    drawLine(canvas, tickPaint, radius * 2.3, 5, 10);
    drawLine(canvas, tickPaint, radius *2.6, 2, 35,lines:60);
    canvas.restore();

    Paint active = new Paint()
      ..color = activeColor
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    var center1 = Offset(size.width / 2, size.height / 2);
    drawArc(canvas, center1, 140, 100, active, radius: 110, rotate: 60);
    drawArc(canvas, center1, 20, 100, active..color=active.color.withOpacity(.8), radius: 110, rotate: 60);
    drawArc(canvas, center1, 260, 100, active..color=active.color.withOpacity(.9), radius: 110, rotate: 60);
 }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void drawArc(
      Canvas canvas, Offset center, double start, double sweep, Paint paint,
      {double radius = 0, double rotate = 0}) {
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -90 + start * pi / 180, sweep * pi / 180, false, paint);
  }

  void drawLine(
      Canvas canvas, Paint paint, double radius, double length, double width,{int lines = 30}) {
    final angle = 2 * pi / lines;
    for (var i = 0; i < lines; i++) {
      int l = 0;
      // if (i % 5 == 0) {
      //   l = 8;
      // }
      paint.strokeWidth = width;
      canvas.drawLine(new Offset(0.0, -radius + l),
          new Offset(0.0, -radius + length), paint);
      canvas.rotate(angle);
    }
  }
}

class ArcPainer2 extends CustomPainter {
  final Color activeColor;
  final double strokeWidth;

  ArcPainer2( this.activeColor,
      {this.strokeWidth = 4});
  @override
  void paint(Canvas canvas, Size size) async {
    final radius = size.width / 2;
    canvas.save();

    final tickPaint = new Paint()..color = activeColor;
    canvas.translate(radius, radius);
   
    drawLine(canvas, tickPaint..color = tickPaint.color.withOpacity(.8), radius *.09, 1, 75,lines:50);
    drawLine(canvas, tickPaint, radius *.5, 1, 75,lines:60);
    drawLine(canvas, tickPaint, radius , .2, 75,lines:90);
    drawLine(canvas, tickPaint, radius *1.65, 1, 5,lines:60);
    
    canvas.restore();
    

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void drawArc(
      Canvas canvas, Offset center, double start, double sweep, Paint paint,
      {double radius = 0, int rotate = 0}) {
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -90 + start * pi / 180, sweep * pi / 180, false, paint);
  }

  void drawLine(
      Canvas canvas, Paint paint, double radius, double length, double width, {lines = 30}) {
    final angle = 2 * pi / lines;
    for (var i = 0; i < lines; i++) {
      int l = 0;
      paint.strokeWidth = width;
      canvas.drawLine(new Offset(0.0, -radius + l),
          new Offset(0.0, -radius + length), paint);
      canvas.rotate(angle);
    }
  }
}
