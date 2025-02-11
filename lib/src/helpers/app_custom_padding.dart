import 'package:flutter/material.dart';

class Dis {
  static EdgeInsets all(double size) => EdgeInsets.all(size);
  static EdgeInsets left(double size) => EdgeInsets.only(left: size);

  static EdgeInsets right(double size) => EdgeInsets.only(right: size);

  static EdgeInsets top(double size) => EdgeInsets.only(top: size);

  static EdgeInsets bottom(double size) => EdgeInsets.only(bottom: size);

  static EdgeInsets lr(double size) => EdgeInsets.only(
    left: size,
    right: size,
  );

  static EdgeInsets tb(double size) => EdgeInsets.only(
    bottom: size,
    top: size,
  );

  static EdgeInsets tr(double size) => EdgeInsets.only(
    top: size,
    right: size,
  );

  static EdgeInsets tl(double size) => EdgeInsets.only(
    top: size,
    left: size,
  );

  static EdgeInsets bl(double size) => EdgeInsets.only(
    bottom: size,
    left: size,
  );

  static EdgeInsets br(double size) => EdgeInsets.only(
    bottom: size,
    right: size,
  );

  ///Padding from left, right, top, bottom
  static EdgeInsets only({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
    double lr = 0.0,
    double tb = 0.0,
  }) {
    return EdgeInsets.only(
      left: left != 0.0 ? left : lr,
      right: right != 0.0 ? right : lr,
      top: top != 0.0 ? top : tb,
      bottom: bottom != 0.0 ? bottom : tb,
    );
  }
}