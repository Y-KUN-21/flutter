import 'package:flutter/material.dart';

class Statewise extends StatefulWidget {
  @override
  _StatewiseState createState() => _StatewiseState();
}

class _StatewiseState extends State<Statewise> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
          itemCount: 29,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 200,
              child: Card(
                child: ListTile(
                  title: Center(child: Text("States")),
                ),
              ),
            );
          },
        ),
      );
  }
}