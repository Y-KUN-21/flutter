import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
class WorldTime {

  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;


  WorldTime({this.location,this.url,this.flag});

  Future <void> getData() async {
  try {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1,3);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
   }

   catch (e){
    time="caught errors";
    print(e);
   }
  }

}