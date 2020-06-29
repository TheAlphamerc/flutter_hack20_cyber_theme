import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hack20_cyber_theme/colors/colors.dart';

class ShapePainter extends CustomPainter {
  final Color textColor;
  final CustomClipper<Path> clipper;

  ShapePainter(this.clipper, {this.textColor = Colors.black});
  @override
  void paint(Canvas canvas, Size size) {
    
    Paint paint = new Paint()
      ..color = Colors.indigo
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = 5;

    final width = size.width;
    final height = size.height;

    canvas.drawLine(new Offset(0.0, 0), Offset(width, 0), paint);

    final rect = Rect.fromCenter(
        center: Offset(width, height / 2), height: 40, width: 40);
    final startAngle = -pi / 2;
    final sweepAngle = pi;
    final useCenter = false;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
    canvas.drawLine(new Offset(width, height), Offset(30, height), paint);
    canvas.drawLine(new Offset(30, height), Offset(00, height - 15), paint);
    canvas.drawLine(new Offset(0, height - 15), Offset(00, 0), paint);

    
    
     var clipPath = clipper.getClip(size);

     canvas.drawPath(clipPath, Paint()..color = CyberColors.BLUE_DARK2.withOpacity(.5));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
     final width = size.width;
    final height = size.height;
    path.lineTo(0, 0);
    path.lineTo(width-1,0);
    path.lineTo(width, height);

    final rect = Rect.fromCenter(
        center: Offset(width, height / 2), height: 40, width: 40);
    final startAngle = -pi / 2;
    final sweepAngle = pi;

    path.arcTo(rect, startAngle, sweepAngle, true);
    path.lineTo(30, size.height);
    path.lineTo(0, size.height - 15);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
   return true;
  }
}
