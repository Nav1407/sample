import 'package:flutter/material.dart';
import 'package:sample_app/Api.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CountryDetails extends StatefulWidget {
  String country_name = '';
  CountryDetails (country_name) {
    this.country_name = country_name;
  }
  @override
  _CountryDetailsState createState() => _CountryDetailsState(country_name);
}

class _CountryDetailsState extends State<CountryDetails> {
  String country_name = '';
  _CountryDetailsState (country_name){
    this.country_name = country_name;
    print(country_name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(this.country_name),
    ),
      body: Container(
          padding: EdgeInsets.all(15.0),
          child: new FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(child:CircularProgressIndicator());
                }
                else return ListView.builder(itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(snapshot.data[i].name),
                  );
                });
             }
              ),
      ),
    );
  }
  Future getData() async {
    final url = "http://universities.hipolabs.com/search?country=United+States";

    var response = await http.get(Uri.https('universities.hipolabs.com', 'search?country=United+States'));
    var jsonData = jsonDecode(response.body);

    List<User> users = [];
    for(var u in jsonData){
      User user = User(u["name"]);
      users.add(user);
    }
    print('------------');
    print(users.length);
    return users;
  }
}
class User {
  final String name;
  User(this.name);
}