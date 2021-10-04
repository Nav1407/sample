import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample_app/university_object.dart';
class APIHelper {
  Future<List<UniversityObj>> getUniversities() async {
    final response =
    await http.get(Uri.parse(
        'http://universities.hipolabs.com/search?country=United+States'));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      final List<dynamic> jsonMap = json.decode(response.body);
      print(jsonMap);

      return jsonMap.map((e) => UniversityObj.fromJson(e)).toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load data');
    }
  }
}