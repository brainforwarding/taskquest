import 'package:flutter/material.dart';
import 'package:covidtasklist/ui/page1.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Page1(),
        theme: new ThemeData(
            primarySwatch: Colors.lightBlue,
            primaryTextTheme:
                TextTheme(headline6: TextStyle(color: Colors.white))));
  }
}

class HomePage extends StatefulWidget {

//data and variables from other pages

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  }
  /*final List taskList = [
    {
      'title': 'title 1',
      'description': 'description 1',
      'subject': 'subject 1',
    },
    {
      'title': 'title 2',
      'description': 'description 2',
      'subject': 'subject 2',
    },
    {
      'title': 'title 3',
      'description': 'description 3',
      'subject': 'subject 3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: const Text("TASKS")),
        backgroundColor: Colors.white,
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: 
          <Widget>
          [...taskList.map((item) => TaskCard(
                  item['title'],item['description'],item['subject'],))
              .toList(),]
        ));
  }
  */
}
