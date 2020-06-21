import 'package:covidtasklist/resources/httpRequests.dart';
import 'package:covidtasklist/ui/tasksPage.dart';
// import 'package:covidtasklist/ui/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

import 'dart:async';
import 'dart:convert' show json;

import "package:http/http.dart" as http;
import 'package:google_sign_in/google_sign_in.dart';

// Google sign in basic DONE
// Make classrooms load DONE
// Make list of classroom IDs DONE
// Use IDs to get lists of students DONE
// Use IDs to get lists of teachers DONE
// POST new teacher courses to backend as new courses... DONE
// POST new teacher to backend as new user... DONE
// POST new student to backend as new user... DONE
// POST student IDs and tasks to Classroom Progress
// Link students to tasks
// POST update tasks on tap with date
// Google login button DONE

// Dropdown of courses
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

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleSignInAccount _currentUser;
  String _classesText;
  List<String> _classIds;
  //Map _rosters;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
        //_classIds = List<String>();
        //_rosters = Map<String, List>();
        print('current user is blas ');
        print(_currentUser);
        print('_classIds is $_classIds');
      });
      if (_currentUser != null) {
        //print('getting classes');
        _handleGetClasses();
        //_handleGetTeachers('43333863362');
        _handleGetStudents('43333863362');
        // Get teacher data per class
        // handlegetteachers per class
        // per teacher, POST to API if not already on it
      }

      print('_classIds is NOW $_classIds');

      if (_classIds != null) {
        print("class ids are");
        print(_classIds);
        for (int i = 0; i < _classIds.length; i++) {
          print('bingo');
          print(_classIds[i]);
          //_handleGetTeachers(_classIds[i]);
        }
      }
    });
    //_googleSignIn.signIn();
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  final title = TextEditingController();
  final description = TextEditingController();

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

    await HttpRequests()
        .getCourse("get_course", "43333863362")
        .then((response) {
      print("Response for get Courses is");
      print(response);
    });

    var classIdsPrep = data.values.toList();
    classIdsPrep = classIdsPrep[0];
    var adder;
    List _classIdsTemp;
    _classIdsTemp = List<String>();
    for (int i = 0; i < classIdsPrep.length; i++) {
      adder = classIdsPrep[i];
      _classIdsTemp.add(adder['id']);
    }
    setState(() {
      if (data != null) {
        _classesText = "Classes loaded!";
        _classIds = _classIdsTemp;
        print("state set");
      } else {
        _classesText = "No classes.";
      }
    });
  }

  // Gets users classroom students
  Future<void> _handleGetStudents(classId) async {
    setState(() {
      _classesText = "Loading students...";
    });
    print('loading students and user is ');
    print(_currentUser);
    final http.Response response = await http.get(
      'https://classroom.googleapis.com/v1/courses/$classId/students',
      //'?requestMask.includeField=courses',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        print("Students API gave a ${response.statusCode} "
            "response. Check logs for details.");
      });
      print('Students API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    print('the roster of students is ');
    print(data["students"]);
    HttpRequests().createStudent("create_student", data["students"]);
    //final String classesList = _classesList(data);
    setState(() {
      if (data != null) {
        print("Students loaded!");
      } else {
        print("No students.");
      }
    });
  }

  // Gets teachers for a class ID
  Future<void> _handleGetTeachers(classId) async {
    setState(() {
      _classesText = "Loading teachers...";
    });
    print('loading teachers and user is ');
    print(_currentUser);
    final http.Response response = await http.get(
      'https://classroom.googleapis.com/v1/courses/$classId/teachers',
      //'?requestMask.includeField=courses',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        print("Classes API gave a ${response.statusCode} "
            "response. Check logs for details.");
      });
      print('Classes API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    print('the list of teachers for class is ');
    print(data["teachers"]);
    HttpRequests().createTeacher("create_teacher", data["teachers"]);
    //final String classesList = _classesList(data);
    setState(() {
      if (data != null) {
        print("Teachers loaded!");
      } else {
        print("No teachers.");
      }
    });
  }

  /*String _listClasses(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }
*/
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn().whenComplete(() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return TasksPage();
            },
          ),
        );
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''), // classroom?
          ),
          const Text("Signed in successfully."),
          Text(_classesText ?? ''),
          for (var item in _classIds) Text(item),
          // Text()
          RaisedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          RaisedButton(
            child: const Text('REFRESH'),
            onPressed: _handleGetClasses,
          ),
        ],
      );
    } else {
      return Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const SizedBox(height: 5),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text("Welcome to", style: TextStyle(fontSize: 20, color: Color(0xFF22215B))),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text("EdTasks",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40, color: Color(0xFF22215B))),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text("Best cloud platform for",
                        style: TextStyle(fontSize: 20, color: Color(0xFF22215B))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text("organizing your tasks to achieve",
                        style: TextStyle(fontSize: 20, color: Color(0xFF22215B))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text("your learning goals.",
                        style: TextStyle(fontSize: 20, color: Color(0xFF22215B))),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text("Join For Free.",
                        style: TextStyle(fontSize: 20, color: Color(0xFF22215B))),
                  ],
                ),
              ],
            ),
            GoogleSignInButton(
              //this.text('Sign in with Google'),
              onPressed: _handleSignIn,
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: _buildBody(),
    ));
  }
}
