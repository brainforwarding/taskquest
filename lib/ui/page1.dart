import 'package:covidtasklist/resources/httpRequests.dart';
import 'package:covidtasklist/ui/menu.dart';
import 'package:flutter/material.dart';
import 'package:covidtasklist/ui/TaskCard.dart';


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
        title: Text('TASKS'),
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
          [...allTasks.map((item) => TaskCard(
                  item['title'],item['description'],))
              .toList(),]
        ) :  Center(child: CircularProgressIndicator(),),        
    );
  }
}