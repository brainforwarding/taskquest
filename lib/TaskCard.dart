import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String subject;
  TaskCard(this.title, this.description, this.subject);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          new Text(title),
          new Text(description),
          RaisedButton(onPressed: null),
        ],
      ),
      color: Colors.teal[100],
    );
  }
}
