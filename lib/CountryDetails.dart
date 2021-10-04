import 'package:flutter/material.dart';
import 'package:sample_app/university_object.dart';

import 'api_helper.dart';

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

  List<UniversityObj>? universities;
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  void getData() async {
    try {
      final res = await APIHelper().getUniversities();
      setState(() {
        universities = res;
      });
    } on Exception catch(e){
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
              e.toString()),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.country_name),
        ),
        body: SafeArea(child:
        universities != null ? ListView.builder(
          itemCount: universities!.length,
          itemBuilder: (context, i) {

            return UniversityView(name: universities![i].name,);
          },
          scrollDirection: Axis.vertical,
        ) : Center(child: CircularProgressIndicator()),)
    );
  }
}
class UniversityView extends StatelessWidget {
  const UniversityView({Key? key,required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: const Offset(0.0, 2.0),
              blurRadius: 4.0,
              spreadRadius: 0.3,
            ),
          ]),
      child: Text(name,style: TextStyle(color: Colors.black,fontSize: 17),),
    );
  }
}