import 'package:flutter/material.dart';

class IconTab extends StatefulWidget {
  final String text;
  final String icon;
  final Color color;

  const IconTab({Key key, this.text, this.icon, this.color})
      : assert(text != null || icon != null || color != null),
        super(key: key);

  @override
  _IconTabState createState() => _IconTabState();
}

const double _kTextAndIconTableHeight = 53.0;
const double _kMarginBottom = 3.0;

class _IconTabState extends State<IconTab> {
  Widget _buildLabelText() {
    return Text(
      widget.text,
      softWrap: false,
      overflow: TextOverflow.fade,
      style: TextStyle(color: widget.color),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    double height = _kTextAndIconTableHeight;
    Widget label = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Image(
            image: AssetImage(widget.icon),
            height: 30.0,
            width: 30.0,
          ),
          margin: EdgeInsets.only(bottom: _kMarginBottom),
        ),
        _buildLabelText()
      ],
    );
    return SizedBox(
      height: height,
      child: Center(
        child: label,
        widthFactor: 1.0,
      ),
    );
  }
}
