import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    /// ** this to create curve on the left side
    /// size.height - 20 to create the curve
    /// it reads from the right
    /// eg: Offset(x-axis, y-axis;
    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    /// combine to create curves
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    /// to draw a stirght line
    final secondFirstCurve = Offset(0, size.height - 20);
    final SecondLastCurve = Offset(size.width-30, size.height - 20);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy, SecondLastCurve.dx, SecondLastCurve.dy);

    final thirdFirstCurve = Offset(size.width, size.height - 20);
    final ThirdLastCurve = Offset(size.width, size.height);
    /// combine to create curves
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, ThirdLastCurve.dx, ThirdLastCurve.dy);

    /// to complete the path
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }

}