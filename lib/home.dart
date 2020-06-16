import 'package:Rally/pages/home_route.dart';
import 'package:Rally/pages/login_page.dart';
import 'package:Rally/utils/colors.dart';
import 'package:flutter/material.dart';

class RallyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rally Proto',
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: _buildRallyTheme(),
      initialRoute: '/login_page',
      routes: {
        '/login_page': (BuildContext context) => LoginPage(),
      },
    );
  }
}

ThemeData _buildRallyTheme() {
  final ThemeData baseTheme = ThemeData.dark();
  return ThemeData(
    primaryColor: RallyColors.pageBg,
    scaffoldBackgroundColor: RallyColors.pageBg,
    textTheme: _buildRallyTextTheme(baseTheme.textTheme),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle:
          TextStyle(color: RallyColors.gray, fontWeight: FontWeight.w500),
      filled: true,
      fillColor: RallyColors.inputBg,
      focusedBorder: InputBorder.none,
    ),
  );
}

TextTheme _buildRallyTextTheme(TextTheme base) {

  return base
      .copyWith(
        bodyText1: base.bodyText1.copyWith(
          fontFamily: "Roboto Condensed",
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: base.bodyText2.copyWith(
          fontFamily: "Eczar",
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
      )
      .apply(
        displayColor: Colors.white,
        bodyColor: Colors.white,
      );

}
