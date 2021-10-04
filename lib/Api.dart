// import 'dart:io';
// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
//
// class ApiRequest{
//   String base_url = "http://universities.hipolabs.com/search?country=United+States";
//
//   getData() async {
//     var response = await http.get(Uri.https('universities.hipolabs.com', 'search?country=United+States'));
//     var jsonData = jsonDecode(response.body);
//     List <User> users = [];
//     for(var u in jsonData){
//       User user = User(u["name"]);
//       users.add(user);
//     }
//     // var convertedDatatoJson = json.encode(response.body);
//     // var data = json.decode(convertedDatatoJson);
//     // print("Respone Data ");
//     // print(response.body);
//     print(users.length);
//     return response;
//   }
// }
// class User {
//   final String name;
//   User(this.name);
// }