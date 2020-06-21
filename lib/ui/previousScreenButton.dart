import 'package:flutter/material.dart';

class PreviousScreenButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RawMaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          elevation: 0.0,
          child: Icon(
            Icons.arrow_back,
            color: Color(0xFFEF7474),
            size: 40.0,
          ),
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20),
        )
      ],
    );
  }
}