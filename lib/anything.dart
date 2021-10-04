// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'api.dart';
// class HomePage extends StatefulWidget {
//   const HomePage({ Key? key }) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final String url ="http://universities.hipolabs.com/search?country=United+States";
//   var isLoading=false;
//   late List data;
//   final apiservice = new ApiRequest();
//   @override
//   void initState(){
//     super.initState();
//     print("````````````````````````````````object````````````````````````````````");
//     ApiRequest apiObj =ApiRequest();
//     //apiObj.getData();
//     // getData()
//     this.getData();
//   }
//   Future<dynamic> getData()async{
//     var response = await http.get(
//       Uri.parse(url),
//     );
//     print("----------------------------------------------------------");
//     print(response.body);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//     );
//   }
// }