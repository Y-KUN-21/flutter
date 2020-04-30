import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // ignore: non_constant_identifier_names
  void SetupWorldTime() async {
  WorldTime instance = WorldTime(location: 'Mumbai',url: 'Asia/Kolkata',flag: 'india.png');
  await instance.getData();
  //print(instance.time);
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location':instance.location,
    'url':instance.url,
    'time':instance.time,
    'isDaytime':instance.isDaytime,
  });
}

  @override
  void initState() {
     super.initState();
     SetupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
