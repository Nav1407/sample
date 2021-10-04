import 'package:flutter/material.dart';
import 'package:sample_app/university_object.dart';
import 'package:url_launcher/url_launcher.dart';
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
      backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          title: Text(this.country_name),
        ),
        body: SafeArea(
          child:
        universities != null ? ListView.builder(
          itemCount: universities!.length,
          itemBuilder: (context, i) {
            return UniversityView(
            name: universities![i].name,
              webPages: universities![i].webPages.toString(),
              );
          },
          scrollDirection: Axis.vertical,
        ) : Center(child: CircularProgressIndicator()),)
    );
  }
}
class UniversityView extends StatelessWidget {
  UniversityView({Key? key,required this.name, required this.webPages}) : super(key: key);
  final String name;
  String webPages = '';

  Future<void> _launchInBrowser(String url) async{
    try {
        await launch(url, forceSafariVC: true, forceWebView: true,);
    } catch (err) {
      throw 'Could not launch $url';
    }
    // if(!await canLaunch(url)){
    //   await launch(url, forceSafariVC: false, forceWebView: false,
    //   );
    // }else{
    //   throw 'Could not launch $url';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.topLeft,
      width: double.infinity,
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: const Offset(0.0, 2.0),
              blurRadius: 4.0,
              spreadRadius: 0.3,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          softWrap: true,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,),),
        FlatButton(
          onPressed: () async {
            _launchInBrowser(webPages);},
            child: Text('More Info', softWrap: true,
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.white),
              ),
        )
      ],
        ),
    );
  }
}