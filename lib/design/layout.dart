import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/design/texts.dart';

width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

setSystemTheme(Color statusBar, Color navigationBar) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarColor: navigationBar,
    statusBarColor: statusBar,
  ));
}

EdgeInsets defaultViewPadding =
    const EdgeInsets.symmetric(horizontal: 32, vertical: 24);

ElevatedButton showPrimaryButton(String title, Function onPressed) =>
    ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
        child: Text(
          title,
          style: buttonText,
        ));

FloatingActionButton showFloatingButton(IconData icon, Function onPressed) =>
    FloatingActionButton(
        onPressed: () => onPressed(),
        backgroundColor: Colors.white,
        child: Icon(icon, color: Colors.black,));
