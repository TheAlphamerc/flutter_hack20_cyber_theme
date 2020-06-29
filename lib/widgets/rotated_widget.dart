import 'dart:math';
import 'package:flutter/material.dart';

class RotatedWidget extends StatelessWidget {
  const RotatedWidget(
      {Key key,
      this.controller,
      this.child,
      this.isAntiClockWise = false})
      : super(key: key);
  final AnimationController controller;
  final Widget child;
  final bool isAntiClockWise;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: controller.value * 2.0 * pi * (isAntiClockWise ? -1 : 1),
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
