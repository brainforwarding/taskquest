import 'package:covidtasklist/resources/httpRequests.dart';
import 'package:covidtasklist/ui/menu.dart';
import 'package:flutter/material.dart';
import 'package:covidtasklist/ui/studentRecord.dart';

class StudentsProgressPage extends StatefulWidget {
  @override
  _StudentsProgressPageState createState() => _StudentsProgressPageState();
}

class _StudentsProgressPageState extends State<StudentsProgressPage> {
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
        title: Text('Students\'s Daily Progress'),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: allTasks != null
          ? ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 8),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Text(
                            'Nombre',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        flex: 5,
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            'tarea 1',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            'tarea 2',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            'tarea 3',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                ),
                ...allTasks.map((item) => StudentRecord(
                    /*
                    item['title'],item['description'],*/
                    )).toList(),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
