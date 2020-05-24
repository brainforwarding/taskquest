import 'package:covidtasklist/resources/httpRequests.dart';
import 'package:covidtasklist/ui/menu.dart';
import 'package:flutter/material.dart';

class TaskDetail extends StatefulWidget {
  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
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
        title: Text('Task Detail'),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: allTasks != null
          ? Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: Column(children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(
                      'Arts',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                  "Paint the Mona Lisa. It has to look EXACTLY like the real one. If necessary take a plane to Paris and take a good look at it. Remember to breathe and do not take more time than allowed.")
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              
                              children: <Widget>[
                                Text(
                                  '20',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  'minutos',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  flex: 4,
                ),
                Container(
                  child: new RaisedButton(
                    onPressed: null,
                    child: Text(
                      'Marcar como completada',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ]),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}