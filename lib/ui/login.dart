// import 'package:covidtasklist/resources/httpRequests.dart';
// import 'package:covidtasklist/ui/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

import 'dart:async';
import 'dart:convert' show json;

import "package:http/http.dart" as http;
import 'package:google_sign_in/google_sign_in.dart';

// Google sign in basic DONE
// Make classrooms load DONE 
// View classrooms and status
// Save new user with tasks
// Update tasks on tap
// Google login button DONE

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

  @override
  void dispose() {    
    title.dispose();
    description.dispose();
    super.dispose();
  }

  final title = TextEditingController();
  final description = TextEditingController();

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
        print('current user is ');
        print(_currentUser);
      });
      if (_currentUser != null) {
        _handleGetClasses();
      }
    });
    //_googleSignIn.signIn();
  }

  Future<void> _handleGetClasses() async {
    setState(() {
      _classesText = "Loading classes...";
    });
    print('loading classes and user is ');
    print(_currentUser);
    final http.Response response = await http.get(
      'https://classroom.googleapis.com/v1/courses',
      //'?requestMask.includeField=courses',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _classesText = "Classes API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('Classes API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    print('the data is ');
    print(data);
    //final String classesList = _classesList(data);
    setState(() {
      if (data != null) {
        _classesText = "Classes loaded!";
      } else {
        _classesText = "No classes.";
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
      await _googleSignIn.signIn();
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
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          GoogleSignInButton(
            //this.text('Sign in with Google'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}
