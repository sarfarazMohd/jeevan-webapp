import 'package:flutter/material.dart';

class topRightClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.moveTo(width * 0.2, height * 0.41);
    path.quadraticBezierTo(
        width * 0.5, height * 0.15, width * 0.8, height * 0.365);
    path.quadraticBezierTo(
        width + 40, height * 0.62, width * 0.5, height * 0.73);
    path.quadraticBezierTo(
        -width * 0.14, height * 0.80, width * 0.2, height * 0.41);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}


//Folloing is not used in project



class topLeft extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.42, 0);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.355,
        size.width * 0.55, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.44, size.height * 0.9, 0, size.height * 0.75);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class topRight extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 0);
    //  path.lineTo(size.width*0.5,size.height*0.5);
    path.quadraticBezierTo(size.width * 0.74, size.height * 0.25,
        size.width * 0.78, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.845, size.height * 0.85, size.width, size.height * 0.95);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class bottomLeft extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 80);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.2,
        size.width * 0.45, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 0.425, size.height * 0.94, size.width * 0.37, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
