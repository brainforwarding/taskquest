import 'package:flutter/material.dart';

class StudentRecord extends StatelessWidget {
  final String name = 'Diego Salvatierra';
  final String task1 = 'OK';
  final String task2 = 'OK';
  final String task3 = null;

  StudentRecord(/*this.title, this.description*/);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          new Text(name),
          new Text(task1),
        ],
      ),
      color: Colors.teal[100],
    );
  }
}