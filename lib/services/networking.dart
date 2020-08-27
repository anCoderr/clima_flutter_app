import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:clima_flutter_app/utilities/constants.dart';


class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  void getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
    }
    else {
      print(response.statusCode);
    }
}

  'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kApiKey');
