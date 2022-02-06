import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 基本のカラー設定
final Color bgColor = HexColor("FFFFFF");
final Color appBarBgColor = HexColor("FFFFFF");
final Color mainColor = HexColor("333333");
final Color textColor = HexColor("333333");
final Color grayTextColor = HexColor("A6A6A6");

// テーマ設定
final themeData = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: mainColor,
  canvasColor: bgColor,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: bgColor,
    modalBackgroundColor: bgColor,
    elevation: 2.0,
    modalElevation: 2.0,
  ),
  bottomNavigationBarTheme: bottomNavigationBarTheme,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white,
    focusColor: textColor,
    splashColor: textColor,
  ),
);

// テキストテーマ
final textTheme = TextTheme(
  button: TextStyle(
    fontFamily: "NotoSansJP",
    color: textColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
  headline1: TextStyle(
    fontFamily: "NotoSansJP",
    color: textColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  ),
  bodyText1: TextStyle(
    fontFamily: "NotoSansJP",
    color: textColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  bodyText2: TextStyle(
    fontFamily: "NotoSansJP",
    color: textColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
);

// AppBarTheme
final appBarTheme = AppBarTheme(
  foregroundColor: textColor,
  backgroundColor: appBarBgColor,
  centerTitle: true,
  elevation: 0.5,
  titleSpacing: 1.0,
  titleTextStyle: TextStyle(
    fontFamily: "Roboto",
    color: textColor,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    letterSpacing: 0.4,
  ),
  actionsIconTheme: IconThemeData(color: textColor),
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: appBarBgColor,
    statusBarBrightness: Brightness.light,
  ),
);

// BottomNavigationBar
final bottomNavigationBarTheme = BottomNavigationBarThemeData(
  selectedItemColor: textColor,
  unselectedItemColor: grayTextColor,
  elevation: 0,
  selectedLabelStyle: TextStyle(
    fontFamily: "NotoSansJP",
    color: textColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
  unselectedLabelStyle: TextStyle(
    fontFamily: "NotoSansJP",
    color: grayTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
  selectedIconTheme: IconThemeData(size: 18, color: textColor),
  unselectedIconTheme: IconThemeData(size: 18, color: grayTextColor),
);

// #000000をColorに直す
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
