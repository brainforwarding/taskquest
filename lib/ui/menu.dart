import 'package:covidtasklist/ui/tasksPage.dart';
import 'package:covidtasklist/ui/tasksAssignPage.dart';
import 'package:covidtasklist/ui/inputPage.dart';
import 'package:covidtasklist/ui/login.dart';
import 'package:covidtasklist/ui/progressPage.dart';
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => TasksPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Assign Tasks'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TasksAssignPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.graphic_eq),
          title: Text('Student\'s Progress'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => StudentsProgressPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.maximize),
          title: Text('Login'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
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