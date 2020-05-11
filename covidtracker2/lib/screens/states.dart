import 'package:flutter/material.dart';

import 'package:gocorona/screens/listview.dart';

class Statewise extends StatefulWidget {
  @override
  _StatewiseState createState() => _StatewiseState();
}

class _StatewiseState extends State<Statewise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Statewise",
            style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.w500
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
          elevation: 0.0,
        ),
        body: Listview());
  }
}
