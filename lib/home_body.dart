import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hack20_cyber_theme/colors/colors.dart';
import 'package:flutter_hack20_cyber_theme/painters/arch_painter.dart';
import 'package:flutter_hack20_cyber_theme/painters/shape_painter.dart';
import 'package:flutter_hack20_cyber_theme/painters/text_painter.dart';
import 'package:flutter_hack20_cyber_theme/painters/ticker_painter.dart';
import 'package:flutter_hack20_cyber_theme/widgets/rotated_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressWidget extends StatefulWidget {
  ProgressWidget({
    Key key,
  }) : super(key: key);

  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget>
    with TickerProviderStateMixin {
  double progress;
  Color activeColor;
  AnimationController _controller;
  AnimationController _controller1;
  @override
  void initState() {
    activeColor = Colors.blue;
    _controller = AnimationController(
        duration: const Duration(seconds: 8),
        vsync: this,
        animationBehavior: AnimationBehavior.preserve);
    _controller1 = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );

    _controller.repeat();
    _controller1.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: mediaQuery.height,
            width: mediaQuery.width,
            child: CustomPaint(
              painter: CustomTextPainter(textColor: CyberColors.BLUE_DARK1),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1.0,
                sigmaY: 1.0,
              ),
              child: Container(color: Colors.black.withOpacity(0)),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Container(
                height: 45,
                margin: EdgeInsets.only(top: 50, left: 16, right: 16),
                padding: EdgeInsets.only(top:5),
                width: mediaQuery.width,
                decoration: BoxDecoration(
                    color: CyberColors.BLUE_DARK2.withOpacity(.5),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.indigo,width: 2),),
                child: Text(
                  "CYBER FLUTTER",
                  style: GoogleFonts.orbitron(
                    textStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
          Container(
            height: mediaQuery.width,
            width: mediaQuery.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(250),
              gradient: RadialGradient(
                colors: [
                  Color(0xff45c4f2).withOpacity(.8),
                  Color(0xff19609b).withAlpha(50),
                  Colors.blue[100].withAlpha(15)
                ],
                stops: [.1, .6, 1],
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 120,
                  color: CyberColors.BLUE_NORMAL.withAlpha(50),
                  spreadRadius: 120,
                  offset: Offset(0, _controller1.value),
                )
              ],
            ),
          ),
          RotatedWidget(
            controller: _controller1,
            child: Container(
              height: 150,
              width: 150,
              child: CustomPaint(
                painter: ArcPainer2(
                  activeColor,
                  strokeWidth: 10,
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            width: 150,
            child: CustomPaint(
              painter: TickerPainter(
                activeColor,
                strokeWidth: 10,
              ),
            ),
          ),
          RotatedWidget(
            controller: _controller1,
            isAntiClockWise: false,
            child: Container(
              height: 150,
              width: 150,
              child: CustomPaint(
                painter: AntiArcPainer(
                  activeColor,
                  strokeWidth: 8,
                ),
              ),
            ),
          ),
          RotatedWidget(
            controller: _controller,
            isAntiClockWise: true,
            child: Container(
              height: 150,
              width: 150,
              child: CustomPaint(
                painter: ArcPainer(
                  activeColor,
                  strokeWidth: 10,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40,
              width: mediaQuery.width * .7,
              margin: EdgeInsets.only(bottom: 50),
              child: ClipPath(
                clipper: ClipPainter(),
                child: CustomPaint(
                  painter: ShapePainter(ClipPainter()),
                  child: Container(
                    padding: EdgeInsets.only(left: 20,top:5),
                    child: Text(
                      "Welcome to CyberVerse",
                      style: GoogleFonts.orbitron(
                        textStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
