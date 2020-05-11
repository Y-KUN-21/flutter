import 'package:http/http.dart' as http;
import 'package:gocorona/models/districtwise.dart';

class ApiDistrictWiseServices {
  static const String url = 'https://api.covid19india.org/v2/state_district_wise.json';
  static Future<List<Districtwise>> getDistrictFromAPI() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final districtwise  = districtwiseFromJson(response.body);
        print(response.body);
        return districtwise;

      } else {
        return List<Districtwise>();
      }
    } catch (e) {
      print("Error" + (e));
      return List<Districtwise>();
    }
  }
}
