import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String subject;
  TaskCard(this.title, this.description, this.subject);

  // chooses image
  String getSubjectImage() {
    print('generating');
    if (subject == 'math')
      return 'assets/images/mathLogo.png';
    else
      return 'assets/images/artLogo.png';
  }

  //String setSubject() {
  //if (subject=='math')
  //}

  //Color(0xFFFEEEEE) light red (art)
  //Color(0xFFAC4040) dark red

  //Color(0xFFEEF7FE) light blue (art)
  //Color(0xFF415EB6) dark blue

  //Color(0xFFFDF7E0) light yellow (art)
  //Color(0xFFA57105) dark yellow (art)
  
  //Color(0xFFF0FFFF) light green (art)
  //Color(0xFF158E8E) dark green (art)

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0xFFFDF7E0),
          //border: Border.all(color: Colors.orangeAccent[100]),
          borderRadius: new BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          new Text(title,
              style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w900,
                  fontSize: 30)),
          new Text(description,
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
          RaisedButton(
              onPressed: null,
              child: Text('Done!', style: TextStyle(color: Colors.white))),
          new Text(title),
          new Text(description),
          //RaisedButton(onPressed: null),
        ],
      ),
    );
  }
}
