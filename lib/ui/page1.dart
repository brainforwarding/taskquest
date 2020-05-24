import 'package:covidtasklist/resources/httpRequests.dart';
import 'package:covidtasklist/ui/menu.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  @override 
  void initState() {    
    super.initState();
    getTasks(); 
  }

  getTasks() async {
    await HttpRequests().getTasks().then((response) {
      setState(() {
        allTasks = response;
      });
    });
  }

  List allTasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: allTasks != null ? 
        ListView.builder(
          itemCount: allTasks.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(allTasks[index]['title']),
                  Text(allTasks[index]['description'])
                ],
              ),
            );
          }
        ) :  Center(child: CircularProgressIndicator(),),        
    );
  }
}