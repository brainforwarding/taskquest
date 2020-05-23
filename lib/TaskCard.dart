import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          const Text("Task name"),
          RaisedButton(onPressed: null),
        ],
      ),
      color: Colors.teal[100],
    );
  }
}