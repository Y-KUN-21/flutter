import 'package:flutter/material.dart';
import 'package:neel/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAMA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          accentColor: Colors.redAccent,
          primaryColorBrightness: Brightness.dark),
      home: Home(),
    );
  }
}
