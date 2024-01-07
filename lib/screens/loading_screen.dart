import 'package:weather/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitWave(size: 70.0, color: Colors.orange),
      ),
    );
  }

  void getWeatherData() async {
    Networking networking = new Networking();
    String data = await networking.getLocationData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(data);
    }));
  }
}
