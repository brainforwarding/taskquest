import 'package:covidtasklist/resources/httpRequests.dart';
import 'package:covidtasklist/ui/menu.dart';
import 'package:flutter/material.dart';
import 'package:covidtasklist/ui/TaskCard.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert' show json;
import "package:http/http.dart" as http;



// Create new teacher page DONE
// Dropdown of courses generate button DONE
// Pass state data to widget DONE
// Load classes
// Select one class
// Get list of students based on selected class
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
  final GoogleSignInAccount currentUser;
  const TasksAssignPage({ Key key, this.currentUser }) : super(key: key);
  
  @override
  _TasksAssignPageState createState() => _TasksAssignPageState();
}

class _TasksAssignPageState extends State<TasksAssignPage> {
  GoogleSignInAccount _currentUser;
  //String _classesText;
  //List<String> _classIds;
  List allTasks;
  String dropdownValue;
  String _classesText;
  List<String> _classIds;

  @override 
  void initState() {    
    super.initState();
    _currentUser = widget.currentUser;
    //print("current user is ");
    //print(_currentUser);
    getTasks(); 
    _handleGetClasses();
  }

  getTasks() async {
    await HttpRequests().getTasks().then((response) {
      setState(() {
        allTasks = response;
        dropdownValue = "Select course";
        _classIds = [dropdownValue];
        //print("current user is NOW ASSIGN ");
        //print(widget.currentUser);
        //print(_currentUser);
      });
    });
  }

  // Gets users classroom IDs
  Future<void> _handleGetClasses() async {
    setState(() {
      _classesText = "Loading classes...";
    });
    final http.Response response = await http.get(
      'https://classroom.googleapis.com/v1/courses',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _classesText = "Classes API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    //print("course data to be sent is");
    //print(data["courses"]);
    //String courseData = data["courses"].toString();

    //HttpRequests().createCourses("create_courses", courseData);
    HttpRequests().createCourses("create_courses", data["courses"]);
    //HttpRequests().createCourses("create_courses", response.body);

   /* await HttpRequests()
        .getCourse("get_course", "43333863362")
        .then((response) {
      print("Response for get Courses is");
      print(response);
    });*/

    var classIdsPrep = data.values.toList();
    classIdsPrep = classIdsPrep[0];
    var adder;
    List _classIdsTemp;
    _classIdsTemp = List<String>();
    print("dropdownvalue is");
    print(dropdownValue);
    _classIdsTemp.add(dropdownValue);
    for (int i = 0; i < classIdsPrep.length; i++) {
      adder = classIdsPrep[i];
      _classIdsTemp.add(adder['id']);
    }
    setState(() {
      if (data != null) {
        _classesText = "Classes loaded!";
        print(_classesText);        
        _classIds = _classIdsTemp;
        print(_classIdsTemp);
        print("CLASS IDS ARE");
        print(_classIds);
      } else {
        _classesText = "No classes.";
      }
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
              items: _classIds.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                ),
                              );
                            }).toList(),
              /*items: <String>[dropdownValue, _classIds[0]]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),*/
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