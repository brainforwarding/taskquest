import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final String description;
  final String subject;

  TaskCard(this.title, this.description, this.subject);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Color backgroundColor = Color(0xFFEEF7FE);
  String buttonText = "Done!";

  String getSubjectImage() {
    print('generating');
    if (widget.subject == 'math')
      return 'assets/images/mathLogo.png';
    else
      return 'assets/images/artLogo.png';
  }

  void clearTask() {
    if (buttonText == "Done!") {
      setState(() {
        backgroundColor = Color(0xFFFEEEEE);
        buttonText = "Undo";
      });
    } else {
      setState(() {
        backgroundColor = Color(0xFFEEF7FE);
        buttonText = "Done!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: new BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          new Text(widget.title,
              style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w900,
                  fontSize: 30)),
          new Text(widget.description,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontStyle: FontStyle.italic,
                  fontSize: 15)),
          new Image.asset(
              getSubjectImage(),
              height: 25,
              width: 25),
          RaisedButton(
              onPressed: clearTask,
              child: Text(buttonText, style: TextStyle(color: Colors.white))),
          new Text(widget.title),
          new Text(widget.description),
        ],
      ),
    );
  }
}
