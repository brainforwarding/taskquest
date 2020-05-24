import 'package:flutter/material.dart';
import 'package:covidtasklist/ui/page1.dart';
import 'package:covidtasklist/ui/TaskCard.dart';

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
    return new Scaffold(
      appBar: AppBar(title: const Text("TASKS")),
      backgroundColor: Colors.white,
      body: GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    // final String text = "hellowidget";
    TaskCard('Maths','30 minutes exercise','math'),
    TaskCard('Arts','40 minutes drawing','art')],
    ));
  }
}
