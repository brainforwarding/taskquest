import 'package:covidtasklist/resources/httpRequests.dart';
import 'package:covidtasklist/ui/menu.dart';
import 'package:flutter/material.dart';
import 'package:covidtasklist/ui/TaskCard.dart';
import 'package:google_sign_in/google_sign_in.dart';


// Create new teacher page DONE
// Dropdown of courses generate button DONE
// Pass state data to widget 
// Select one course
// Get list of students based on selected course
// Add list of students to POST request

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/classroom.profile.emails',
    'https://www.googleapis.com/auth/classroom.rosters.readonly',
    'https://www.googleapis.com/auth/classroom.courses.readonly',
  ],
); 

class TasksAssignPage extends StatefulWidget {

  @override
  _TasksAssignPageState createState() => _TasksAssignPageState();
}

class _TasksAssignPageState extends State<TasksAssignPage> {
GoogleSignInAccount _currentUser;

//GoogleSignInAccount get currentUser => _currentUser;
  //String _classesText;
  //List<String> _classIds;

  List allTasks;
  String dropdownValue;

  @override 
  void initState() {    
    super.initState();
    _currentUser = _googleSignIn.currentUser;
    print("current user is ");
    print(_currentUser);
    print(_googleSignIn);
    getTasks(); 
  }

  getTasks() async {
    await HttpRequests().getTasks().then((response) {
      setState(() {
        allTasks = response;
        dropdownValue = "Select course";
        print("current user is NOW ");
        print(_currentUser);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assign Tasks'),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: allTasks != null ? 
        Column(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[dropdownValue, "43333863362"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            /*GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: 
              <Widget> 
              [...allTasks.map((item) => TaskCard(
                      item['title'],item['description'],item['subject']))
                  .toList(),]
            ),*/
          ],
        ) :  Center(child: CircularProgressIndicator(),),                     
   );  
  }
}