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

  String getSubjectImage() {
    print('generating');
    if (widget.subject == 'math')
      return 'assets/images/mathLogo.png';
    else
      return 'assets/images/artLogo.png';
  }

  void clearTask() {
    setState(() {
      backgroundColor = Color(0xFFFEEEEE);
      myButton(0);
    });
  }

  Widget myButton(value) {
    if (value == 1) {
      return RaisedButton(
          onPressed: clearTask,
          child: Text('Done!', style: TextStyle(color: Colors.white)));
    } else {
      setState(() {
        return RaisedButton(
            onPressed: null,
            child: Text('Revert', style: TextStyle(color: Colors.white)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: backgroundColor,
          //border: Border.all(color: Colors.orangeAccent[100]),
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
          //new Text(subject),
          new Image.asset(
              // change images based on input DONE
              getSubjectImage(),
              height: 25,
              width: 25),
          myButton(1),
          new Text(widget.title),
          new Text(widget.description),
          //RaisedButton(onPressed: null),
        ],
      ),
    );
  }
}
