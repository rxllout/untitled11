// ignore_for_file: use_build_context_synchronously

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/lib/services/weather.dart';
import '../screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather().timeout(
          const Duration(seconds: 5),
        );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen(weatherData)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(
          "https://w.wallhaven.cc/full/4y/wallhaven-4y37g0.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        const SpinKitWave(
          color: Color(0xff1C173E),
          size: 100,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              getLocationData();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              elevation: (10),
            ),
            child: const Text('Get Location'),
          ),
        ),
      ],
    );
  }
}
