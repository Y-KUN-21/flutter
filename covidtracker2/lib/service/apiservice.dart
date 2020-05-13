import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:gocorona/models/totals.dart';

class ApiServices {
  static const String url = 'https://api.rootnet.in/covid19-in/stats/latest';
  static Future<Data> getDataFromAPI() async {
    try {
      final response = await http.get(url);
      String filename = "cache.json";
      var dir = await getTemporaryDirectory();
      File file = new File(dir.path + "/$filename");
      if (file.existsSync()) {
        print("Loading from cache....");
        var jsonData = file.readAsStringSync();
        final data = dataFromJson(jsonData);
          Timer.periodic(Duration(minutes: 120), (timer) {
            try {
              file.deleteSync(recursive: true);
            } on FileSystemException {
              print('File does\'nt exist.. wait');
            }
          });
        return data;
      } else {
        if (200 == response.statusCode) {
          print("Loading from api....");
          final data = dataFromJson(response.body);
          file.writeAsStringSync(response.body,
              flush: true, mode: FileMode.write);
          return data;
        } else {
          return Data();
        }
      }
    } catch (e) {
      print("Error" + (e));
      return Data();
    }
  }
}
