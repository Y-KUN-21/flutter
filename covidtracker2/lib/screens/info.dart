import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 200,
              child: Card(
                child: ListTile(
                  title: Text("info"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
