import 'package:clima_flutter_app/services/location.dart';
import 'package:clima_flutter_app/services/networking.dart';
import 'package:clima_flutter_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

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
    getLocationAndData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitDoubleBounce(
      color: Colors.white,
      size: 100.0,
    )));
  }

  void getLocationAndData() async {
    print('getloc+data starts');
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude)&appid=$kApiKey');
    var weatherData = await networkHelper.getData();
    print('getloc+data mid');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
    print('getloc+data ends');
  }
}
