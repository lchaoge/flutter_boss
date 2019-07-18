import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_boss/home_page.dart';
import 'package:flutter_boss/common/style/style.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _t;

  @override
  void initState() {
    super.initState();
    _t = new Timer(const Duration(milliseconds: 1500), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            (Route route) => route == null);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    super.dispose();
    _t.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: BossColors.primaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: 150.0),
        child: Column(
          children: <Widget>[
            Text(
              'BOSS直聘',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
