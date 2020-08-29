import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    print('data starts');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
    print('data ends');
  }
}

// var temperature = decodedData['main']['temp'];
// var condition = decodedData['weather'][0]['id'];
// var cityName = decodedData['name'];
