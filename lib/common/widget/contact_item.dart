import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String count;
  final String title;
  final VoidCallback onPressed;

  ContactItem({Key key, this.count, this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Text(count,
                style: TextStyle(
                  fontSize: 22.0,
                )),
          ),
          Text(title)
        ],
      ),
    );
  }
}
