import 'dart:convert';
import 'dart:developer';
import '../../app_config/app_config.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static getData({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    log("ApiHelper>getData");
    final url = Uri.parse(AppConfig.baseUrl + endPoint);
    try {
      var response = await http.get(url);
      log("Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        log(decodedData.toString());
        var data = {
          "status": 1,
          "data": decodedData,
        };
        log("return data -> $data");
        return data;
      } else {
        log("Else Condition >> Api failed");
        var data = {
          "status": 0,
          "data": null,
        };
        return data;
      }
    } catch (e) {
      log("$e");
    }
  }
}
