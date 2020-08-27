import 'package:clima_flutter_app/services/location.dart';
import 'package:clima_flutter_app/services/networking.dart';
import 'package:clima_flutter_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationAndWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void getLocationAndWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kApiKey');
    );
  }

  void getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kApiKey');
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      var temperature = decodedData['main']['temp'];
      var condition = decodedData['weather'][0]['id'];
      var cityName = decodedData['name'];
      print(temperature);
      print(condition);
      print(cityName);
    }
  }
}
