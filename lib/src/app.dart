import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qib_app/src/views/utils/colors.dart';
import 'package:qib_app/src/views/utils/style.dart';

class MainApp extends StatelessWidget {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(headline1: AppBarTextStyle),
        ),
        primaryTextTheme: TextTheme(
          headline1: textStyle(parseColor(themePrimaryColor), FontWeight.normal, MediumTextSize),
          bodyText1:  textStyle(parseColor(themePrimaryColor), FontWeight.normal, BodyTextSize),
        ),
      ),
      initialRoute: "/",
      navigatorKey: Modular.navigatorKey,
      // add Modular to manage the routing system
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
