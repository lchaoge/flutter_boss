import 'package:flutter/material.dart';

class CompanyHotJob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: '尽情期待',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              )
            ),
          )
        ],
      ),
    );
  }
}