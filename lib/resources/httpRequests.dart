import 'dart:convert';
import 'package:http/http.dart';


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
}