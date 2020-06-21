import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


/*class GetCourses {
    final String action;
    final Map<String, dynamic> courses;

    GetCourses({this.action, this.courses});

    factory GetCourses.fromJson(Map<String><dynamic> json) {
      return Album(
        action: json['action'],
        courses: json['courses'],
      );
    }
  }*/

class HttpRequests { 

  Future<List> getTasks() async {            
                 
    final String getTasksUrl = "https://whmemmi3md.execute-api.us-east-1.amazonaws.com/default/GetTasks";            
    
    Response res = await get(getTasksUrl);
    if (res.statusCode == 200) {
      List responseJson = jsonDecode(res.body);      
      return responseJson;         
    } else {
      return null;
    }
  }  

  Future<dynamic> setTasks(title, description) async {            
                 
    final String setTasksUrl = "https://whmemmi3md.execute-api.us-east-1.amazonaws.com/default/GetTasks?title=$title&description=$description";            
    
    Response res = await post(setTasksUrl);
    if (res.statusCode == 200) {      
      var responseJson = jsonDecode(res.body);      
      print(responseJson);
      return responseJson;         
    } else {
      return null;
    }
  }


// Adds a new course
  Future<dynamic> createCourses(action, courses) async { 
    print("courses are being created"); 
    print(action);
    print(courses);  
    var data = jsonEncode(<String, dynamic>{
        'action': action,
        'courses': courses,
      });  
    //print("DATA to be sent is ");
    //print(data); 
    final http.Response response = await http.post(
      'https://rex6jd3lq6.execute-api.us-east-1.amazonaws.com/default/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data,
    );
    if (response.statusCode == 200) {
      print("Success! Status 200");
      print(response);
    }
    else {
      print("Failure :( Code is: ");
      print(response.statusCode);
    }
  }

// Adds a new teacher
  Future<dynamic> createTeacher(action, teacher) async { 
    print("teachers are being created"); 
    print(action);
    print(teacher);  
    var data = jsonEncode(<String, dynamic>{
        'action': action,
        'teachers': teacher,
      });  
    print("TEACHER DATA to be sent is ");
    print(data); 
    final http.Response response = await http.post(
      'https://rex6jd3lq6.execute-api.us-east-1.amazonaws.com/default/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data,
    );
    if (response.statusCode == 200) {
      print("Teacher creation Success! Status 200");
      print(response);
    }
    else {
      print("Failure :( Code is: ");
      print(response.statusCode);
    }
  }

  // Adds a new student
  Future<dynamic> createStudent(action, student) async { 
    print("students are being created"); 
    print(action);
    print(student);  
    var data = jsonEncode(<String, dynamic>{
        'action': action,
        'student': student,
      });  
    print("STUDENT DATA to be sent is ");
    print(data); 
    final http.Response response = await http.post(
      'https://j6dcsv9h2d.execute-api.us-east-1.amazonaws.com/default',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data,
    );
    if (response.statusCode == 200) {
      print("Student creation Success! Status 200");
      print(response);
    }
    else {
      print("Failure :( Code is: ");
      print(response.statusCode);
    }
  }

    /*
    final String createCoursesUrl = "https://rex6jd3lq6.execute-api.us-east-1.amazonaws.com/default/?action=$action&courses=$courses";            
    print("courses is");
    print(action);
    print(courses);
    Response res = await post(createCoursesUrl);
    if (res.statusCode == 201) {      
      var responseJson = jsonDecode(res.body);      
      print(responseJson);
      print("courses are being entered!");
      return responseJson;         
    } else {
      print("create request failed");
      return null;
    }
  } */

  Future<List> getCourse(action, id) async {            
                 
    final String getCourseUrl = "https://rex6jd3lq6.execute-api.us-east-1.amazonaws.com/default/?action=$action&id=$id";            
    
    Response res = await get(getCourseUrl);
    if (res.statusCode == 200) {
      List responseJson = jsonDecode(res.body); 
      print("getting course info");     
      return responseJson;         
    } else {
      print("get request failed");
      return null;
    }
  } 



}