import 'package:covidtasklist/resources/httpRequests.dart';
import 'package:covidtasklist/ui/menu.dart';
import 'package:flutter/material.dart';
import 'package:covidtasklist/ui/TaskCard.dart';

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
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
      appBar: AppBar(),
      drawer: Drawer(
        child: Menu(),
      ),
      body: allTasks != null
          ? Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left:20, right:20, top:50, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        'Your Daily Tasks',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30, color: Color(0xFF22215B)),
                      ),
                    ],
                  ),
                ),
                new Expanded(
                  child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        ...allTasks
                            .map((item) => TaskCard(item['title'],
                                item['description'], item['subject']))
                            .toList(),
                      ]),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
