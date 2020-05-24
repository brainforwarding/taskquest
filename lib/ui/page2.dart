import 'package:covidtasklist/resources/httpRequests.dart';
import 'package:covidtasklist/ui/menu.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {  

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  void dispose() {    
    title.dispose();
    description.dispose();
    super.dispose();
  }

  final title = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text('Title'),
            TextField(
              controller: title,
            ),
            Text('Description'),
            TextField(
              controller: description,
            ),
            FlatButton(
              child: Text('Upload', style: TextStyle(fontSize: 30.0),),
              onPressed: () {
                HttpRequests().setTasks(title.text, description.text);                
              },
            )
          ],
        )
        ),
    );
  }
}