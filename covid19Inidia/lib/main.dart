import 'package:covid19/Stateswise.dart';
import 'package:flutter/material.dart';
import 'package:covid19/home.dart';
import 'package:covid19/info.dart';


void main() => runApp(MaterialApp(
debugShowCheckedModeBanner: false,
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
    '/info':(context) => Info(),
    '/states':(context) => Statewise(),
  },
));



