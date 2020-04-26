import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class Info extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(56,60,74, 100),
      appBar: AppBar(
        title: Text("INFO",
          style: TextStyle(
            color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(56,60,74, 100),
      ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
              child: Text("Common symptoms.",style: GoogleFonts.comfortaa(textStyle: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text("1  Fever. \n2 Tiredness. \n3 Dry cough. \n4 Diarrhoea. \n5 Nasal congestion.",
                style:GoogleFonts.comfortaa(textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,),
                ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
              child: Text("What you should Do.",style: GoogleFonts.comfortaa(textStyle: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
              child: Text("1 STAY home. \n2 KEEP a safe distance. \n3 WASH hands often. \n4 COVER your cough. \n5 SICK? Call the helpline.",
                style:GoogleFonts.comfortaa(textStyle: TextStyle(
                  color: Colors.white,
                fontSize: 20,
              ),),),
            ),
            SizedBox(height: 50,),
            Center(
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    icon:FaIcon(FontAwesomeIcons.phone,
                    size: 17,color: Colors.redAccent,),
                    label: Text("+91-11-23978046",
                    style: TextStyle(fontSize: 17,
                    color: Colors.white),),
                    onPressed: () {},
                  ),
                  FlatButton.icon(
                    icon:Icon(Icons.email,
                      size: 17,color: Colors.redAccent,),
                    label: Text("ncov2019@gov.in",
                      style: TextStyle(fontSize: 17,
                          color: Colors.white),),
                    onPressed: () {},
                  ),
                  FlatButton.icon(
                    icon:FaIcon(FontAwesomeIcons.whatsapp,
                      size: 17,color: Colors.redAccent,),
                    label: Text("+91 90131 51515",
                      style: TextStyle(fontSize: 17,
                          color: Colors.white),),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
              bottomNavigationBar: CurvedNavigationBar(
       backgroundColor:Color.fromRGBO(75,81,98,50),
        color: Colors.black,
        buttonBackgroundColor:Color.fromRGBO(75,81,98,100),
        height: 46,
        items: <Widget>[
          Icon(Icons.list, size: 30,color: Colors.white,),
          Icon(Icons.home, size: 30,color: Colors.white,),
          Icon(Icons.info_outline, size: 30,color: Colors.white,),
        ],
        index: 2,
        onTap: (index) {
          if(index==0){
            Navigator.pushReplacementNamed(context, "/states");
          }
          else if(index==1)
          {
            Navigator.pushReplacementNamed(context, "/home");
          }
          //Handle button tap
        },
        animationDuration: Duration(
          milliseconds: 200,
        ),
        animationCurve: Curves.easeIn,
      ),
    );
  }
}
