import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                      alignment: Alignment.center,
                      child: RaisedButton(
                          onPressed: null,
                          child: Text('Task',
                              style: TextStyle(color: Colors.white))),
    );
  }
}