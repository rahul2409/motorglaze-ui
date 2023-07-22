import 'package:flutter/material.dart';

TextStyle customTextStyle(
    {Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontWeight: fontWeight ?? FontWeight.normal,
    fontSize: fontSize ?? 16.0,
    fontStyle: fontStyle ?? FontStyle.normal,
    fontFamily: 'Open Sans',
  );
}

LinearGradient customBackgroundGradient({
  List<Color>? colors,
  AlignmentGeometry? begin,
  AlignmentGeometry? end,
  List<double>? stops,
  TileMode? tileMode,
  GradientTransform? transform,
}) {
  // = TileMode.clamp,
  return LinearGradient(
    colors: colors ?? [Colors.blue[800]!, Colors.blue[400]!],
    begin: begin ?? Alignment.topCenter,
    end: end ?? Alignment.bottomCenter,
    tileMode: tileMode ?? TileMode.clamp,
  );
}
