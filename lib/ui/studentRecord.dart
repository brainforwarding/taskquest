import 'package:flutter/material.dart';

class StudentRecord extends StatelessWidget {
  final String name = 'Diego Salvatierra';
  final String task1 = 'OK';
  final String task2 = 'OK';
  final String task3 = 'OK';

  StudentRecord(/*this.title, this.description*/);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                name,
                textAlign: TextAlign.left,
              ),
            ),
            flex: 5,
          ),
          Expanded(
            child: Container(
              child: Text(
                task1,
                textAlign: TextAlign.center,
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              child: Text(
                task2,
                textAlign: TextAlign.center,
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              child: Text(
                task3,
                textAlign: TextAlign.center,
              ),
            ),
            flex: 2,
          ),
        ],
      ),
      //color: Colors.teal[100],
    );
  }
}
