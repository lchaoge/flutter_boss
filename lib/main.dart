import 'package:flutter/material.dart';
import 'package:flutter_boss/splash_page.dart';

import 'package:flutter_boss/common/style/style.dart';

void main(){
  runApp(new MaterialApp(
    title:"Boss直聘",
    theme:ThemeData(
      primaryIconTheme: const IconThemeData(
        color: Colors.white
      ),
      brightness: Brightness.light,
      primaryColor: BossColors.primaryColor,
      accentColor: Colors.cyan[300]
    ),
    home: SplashPage(),
  ));
}