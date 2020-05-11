import 'package:flutter/material.dart';
import 'package:gocorona/models/information.dart';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
         title: Text(
            "Symtoms",
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
              itemCount: symtoms.length,
              itemBuilder: ((context, index) {
                return Container(
                  height: size.height*.20,
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
                            symtoms[index].imgpath,
                            width: 150,
                            height: 120,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: symtoms[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 30),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "\n${symtoms[index].description}",
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
