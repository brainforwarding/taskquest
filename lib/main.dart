import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new HomePage(),
        theme: new ThemeData(
            primarySwatch: Colors.lightBlue,
            primaryTextTheme:
                TextTheme(headline6: TextStyle(color: Colors.white))));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: const Text("Task Quest")),
      backgroundColor: Colors.white,
      body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    onPressed: null,
                    child: Text('Task',
                        style: TextStyle(color: Colors.white)))
              ],
            ),
    );
  }
}
