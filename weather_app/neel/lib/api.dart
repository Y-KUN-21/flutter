import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Map data;
  Future<String> goApi(String city, unit) async {
    String key = "YOUR_API_KEY";
    var response = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$key&units=$unit");
    data = await json.decode(response.body);
    return "success !";
  }
}
