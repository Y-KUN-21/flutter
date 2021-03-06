import 'package:flutter/material.dart';
import 'package:gocorona/models/information.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
                  height: size.height * .25,
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
                            child: Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  AutoSizeText(
                                    preventions[index].title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 25.0,
                                    ),
                                    maxFontSize: 20,
                                    minFontSize: 15,
                                    maxLines: 1,
                                    
                                  ),
                                  AutoSizeText(
                                    "\n${preventions[index].description}",
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,fontFamily: "Poppins"),
                                    maxFontSize: 15,
                                    minFontSize: 5,
                                    maxLines: 6,
                                  )
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
