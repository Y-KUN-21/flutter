import 'package:http/http.dart' as http;
import 'package:gocorona/models/totals.dart';

class ApiServices {
  static const String url = 'https://api.rootnet.in/covid19-in/stats/latest';
  static Future<Data> getDataFromAPI() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        print(response.toString());

        final data = dataFromJson(response.body);

        return data;
      } else {
        return Data();
      }
    } catch (e) {
      print("Error" + (e));
      return Data();
    }
  }
}
