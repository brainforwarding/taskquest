import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text('data'),
                          RaisedButton(
                              onPressed: null,
                              child: Text('Task',
                                  style: TextStyle(color: Colors.white))),
                        ],
                      ),
    );
  }
}