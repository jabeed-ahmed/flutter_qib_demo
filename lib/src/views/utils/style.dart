import 'package:flutter/material.dart';

import 'colors.dart';

const LargeTextSize = 28.0;
const MediumTextSize = 20.0;
const RegularTextSize = 18.0;
const BodyTextSize = 16.0;
const SmallTextSize = 14.0;

const String FontNameDefault = 'SourceSansPro';

const AppBarTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w900,
  fontSize: MediumTextSize,
  color: Colors.white,
);

const ButtonTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: RegularTextSize,
  color: Colors.white,
);

textStyle(Color color, var textWeight, double fontSize) {
  return TextStyle(
      fontFamily: FontNameDefault,
      fontWeight: textWeight,
      fontSize: fontSize,
      color: color);
}

/* OUTLINE BORDER STYLE DECORATION */
const OutlineBorderStyleBorder = OutlineInputBorder(
  borderRadius: const BorderRadius.all(
    const Radius.circular(10.0),
  ),
);

/* OUTLINE ENABLED BORDER STYLE DECORATION */
const OutlineEnabledBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.white70,
  ),
  borderRadius: const BorderRadius.all(
    const Radius.circular(10.0),
  ),
);

/* OUTLINE FOCUSED BORDER STYLE DECORATION */
const OutlineFocusedBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.white70,
  ),
  borderRadius: const BorderRadius.all(
    const Radius.circular(10.0),
  ),
);

/* BUTTON UI */
buttonStyle() {
  return ElevatedButton.styleFrom(
    primary: parseColor(themePrimaryColor),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    textStyle: textStyle(
        parseColor(themePrimaryColor), FontWeight.normal, RegularTextSize),
  );
}
