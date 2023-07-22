import 'package:flutter/material.dart';
import 'package:memberships_ui/screens/hidden_drawer.dart';

TextStyle customTextStyle(
    {Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle}) {
  return TextStyle(
    color: color ?? Colors.grey[850]!,
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
    colors: colors ?? [Colors.grey[600]!, Colors.grey[400]!, Colors.grey[200]!],
    begin: begin ?? Alignment.topCenter,
    end: end ?? Alignment.bottomCenter,
    tileMode: tileMode ?? TileMode.clamp,
  );
}

ListTile drawerListTile(session, title, context, routeName, icon) {
  return ListTile(
    leading: icon,
    title: Text(
      "$title",
      style: customTextStyle(),
    ),
    onTap: () => {
      Scaffold(
        body: Stack(
          children: [
            HiddenDrawer(session),
          ],
        ),
      )
    },
  );
}
