import 'package:covidtasklist/ui/page1.dart';
import 'package:covidtasklist/ui/page2.dart';
import 'package:covidtasklist/ui/page3.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,                        
          ),          
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Tasks'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
          },
        ),
        ListTile(
          leading: Icon(Icons.graphic_eq),
          title: Text('Student\'s Progress'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Page3()));
          },
        ),
        ListTile(
          leading: Icon(Icons.mail),
          title: Text('Input'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
          },
        ),
      ],
    );
  }
}