import 'package:covidtasklist/resources/httpRequests.dart';
import 'package:covidtasklist/ui/menu.dart';
import 'package:flutter/material.dart';
import 'package:covidtasklist/ui/studentRecord.dart';


class Page3 extends StatefulWidget {

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {

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
        GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children:
          <Widget>
          [...allTasks.map((item) => StudentRecord(/*
                  item['title'],item['description'],*/))
              .toList(),]
        ) :  Center(child: CircularProgressIndicator(),),        
    );
  }
}