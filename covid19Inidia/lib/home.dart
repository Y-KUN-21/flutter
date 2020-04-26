import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
  String active;
    String confirmed;
    String deaths;
    String deltaconfirmed;
    String deltadeaths;
    String deltarecovered;
    String lastupdatedtime;
    String recovered;
    String statecode;
    String statenotes;
    String updated;
class _HomeState extends State<Home> {
dynamic data;
  Future<String> _getData() async {
      Response response = await http.get("https://api.covid19india.org/data.json");
       var jSondata = jsonDecode(response.body);
      
      setState(() {
      data = jSondata["statewise"][0];
      });
      return "success";
    }

    @override
  void initState() {
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    if(data == null){
        return Scaffold(
      backgroundColor:Color.fromRGBO(75,81,98,50),
      body: Center(
        child: SpinKitWave(
          color: Colors.redAccent,
          size: 50,
        ),
      )
    );
    }
    else{
    return Scaffold(
      backgroundColor:Color.fromRGBO(75,81,98,50),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height:250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(35),bottomRight:Radius.circular(35)),
                  color: Color.fromRGBO(56,60,74, 100),
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:50.0),
                        child: Text("Total  Cases",style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.white,
                        fontSize: 40,letterSpacing: 1.0,fontWeight: FontWeight.bold),),
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Text(data["confirmed"],style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.redAccent,
                        fontSize: 40,letterSpacing: 1.0,fontWeight: FontWeight.bold,),),
                      ),),
              
                     Padding(
                       padding: const EdgeInsets.only(top:40,bottom: 2),
                       child: Text(data["lastupdatedtime"],style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.white,
                            fontSize: 20,letterSpacing: 1.0,fontWeight: FontWeight.bold),),
                     ),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,40,20,10),
                child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Active",style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.white,
                            fontSize: 30,letterSpacing: 1.0,fontWeight: FontWeight.bold),),),
                        Text(data["active"],style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.orangeAccent,
                            fontSize: 30,letterSpacing: 1.0,fontWeight: FontWeight.bold),),),
                      ],
                    ),
                    SizedBox(height:30),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Deaths",style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.white,
                            fontSize: 30,letterSpacing: 1.0,fontWeight: FontWeight.bold),),),
                        Text(data["deaths"],style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.redAccent,
                            fontSize: 30,letterSpacing: 1.0,fontWeight: FontWeight.bold),),),
                      ],
                    ),
                    SizedBox(height:30),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Recoverd",style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.white,
                            fontSize: 30,letterSpacing: 1.0,fontWeight: FontWeight.bold),),),
                        Text(data["recovered"],style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.greenAccent,
                            fontSize: 30,letterSpacing: 1.0,fontWeight: FontWeight.bold),),),
                      ],
                    ),
                    SizedBox(height:30),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("New",style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.white,
                            fontSize: 30,letterSpacing: 1.0,fontWeight: FontWeight.bold),),),
                        Text(data["deltaconfirmed"],style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.white,
                            fontSize: 30,letterSpacing: 1.0,fontWeight: FontWeight.bold),),),
                      ],
                    ),  
                  ],
                ),
              )
            ],
          ),
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
        index: 1,
        onTap: (index) {
          if(index==0){
            Navigator.pushReplacementNamed(context, "/states");
          }
          else if(index==2)
          {
            Navigator.pushReplacementNamed(context, "/info");
          }
          //Handle button tap
        },
        animationDuration: Duration(
          milliseconds: 200,
        ),
        animationCurve: Curves.easeIn,
      ),
    );
}}}