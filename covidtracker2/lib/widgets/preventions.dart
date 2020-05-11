import 'package:flutter/material.dart';
import 'package:gocorona/models/information.dart';

class Prevention extends StatefulWidget {
  @override
  _PreventionState createState() => _PreventionState();
}

class _PreventionState extends State<Prevention> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
         title: Text(
            "Preventions",
            style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.w500
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
          elevation: 0.0,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: preventions.length,
              itemBuilder: ((context, index) {
                return Container(
                  height: size.height * .20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(
                            preventions[index].imgpath,
                            width: 150,
                            height: 120,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: preventions[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 30),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "\n${preventions[index].description}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }))),
    );
  }
}
