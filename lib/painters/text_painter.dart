import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomTextPainter extends CustomPainter {
  final Color textColor;

  CustomTextPainter({this.textColor = Colors.black});
  @override
  void paint(Canvas canvas, Size size) {
    final paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    for (double j = 12; j < size.width; j += 20) {
      for (double i = 0; i < size.height; i += 19) {
        if (j % 3 == 0 && i % 7 == 0 || i % j == 0) {
          continue;
        }
        final textStyle = ui.TextStyle(
          color: textColor,//Colors.green[j % 100 == 0 ? j : 900],
          fontSize: 8,
        );
        final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(textStyle)
          ..addText(i % 2 == 0 ? "0" : "1");
        final constraints = ui.ParagraphConstraints(width: 30);
        final paragraph = paragraphBuilder.build();
        paragraph.layout(constraints);
        double x = 0, y = 0;
        x = j;
        y = i;
        final offset = Offset(x, y);

        canvas.drawParagraph(paragraph, offset);
      }
    }
  
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
