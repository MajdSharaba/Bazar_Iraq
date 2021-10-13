import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pazar_iraq/app/core/constants.dart';

import 'clippainter.dart';


class BezierContainer extends StatelessWidget {
  const BezierContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
          angle: -pi / 3.5,
          child: ClipPath(
            clipper: ClipPainter(),
            child: Container(
              height: deviceHeight*.5,
              width: deviceWidth,
              decoration: BoxDecoration(
                  gradient: linearGradientColor
                  )
              ),
            ),
          ),

    );
  }
}