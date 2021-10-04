import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'anything.dart';
import 'CountryDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _items = [];

  Future<void> readJsonData() async {
    final jsondata = await rootBundle.loadString('assets/Country.json');
    final list = json.decode(jsondata);

    setState(() {
      _items = list["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: readJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (_items.length > 0) {
          return Scaffold(
            backgroundColor: Colors.deepPurpleAccent,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Countries',
              ),
            ),
            body: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 1600,
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return CountryDetails(_items[index]["name"]);
                        }));
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Stack(
                          children: <Widget>[
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                constraints:
                                    BoxConstraints( maxHeight: 120),
                                // height: 120.0,
                              ),
                            ),
                            Positioned(
                              top: 2,
                              width: 115,
                              height: 115,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(_items[index]["image"].toString()),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            Positioned(
                              top: 45,
                              left: 180,
                              child: Text(
                                _items[index]["name"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  );
                  //   ),
                  //  ],
                  // );
                },
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
