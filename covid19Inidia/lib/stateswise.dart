import 'dart:convert';
import 'dart:ffi';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Statewise extends StatefulWidget {
  @override
  _StatewiseState createState() => _StatewiseState();
}

class _StatewiseState extends State<Statewise> {
  
    List data;

  @override
  Void initState (){
    super.initState();
    this.getData();
  }

  Future <String> getData() async {
    http.Response response = await http.get("https://api.covid19india.org/data.json");
    var convertData = jsonDecode(response.body);
    setState((){
    data = convertData['statewise'];
    // print(convertData);
    
  });
  
  // print(data);
  return "ok";
  }

  @override
  Widget build(BuildContext context) {
    if (data !=null){
    return Scaffold(
      appBar: AppBar(
        title: Text("Statewise",
        style:GoogleFonts.comfortaa(textStyle:TextStyle(fontSize: 25),),
      ),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(75,81,98,50),
      ),
      backgroundColor:Color.fromRGBO(75,81,98,50),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: data == null ? 0 : data.length, 
              itemBuilder:(BuildContext context, index){
                return Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left:5.0,right:5.0, top: 5),
                        child: Card(
                            child: Container(
                              height: 80,
                              color:Color.fromRGBO(75,81,98,50),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                     child: Text(data[index]['state'],style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.white,
                                        fontSize: 25,letterSpacing: 0.0,fontWeight: FontWeight.bold),),),
                                  ),
                                  Text(data[index]['confirmed'],style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.orangeAccent,
                                      fontSize: 25,letterSpacing: 1.0,fontWeight: FontWeight.bold),),),
                                  SizedBox(width:5.0),
                                  Text("+"+data[index]['recovered'],style: GoogleFonts.comfortaa(textStyle:  TextStyle(color: Colors.lightGreenAccent,
                                      fontSize: 15,letterSpacing: 1.0,fontWeight: FontWeight.bold),),),
                                ],
                                ),
                              ),
                            ),
                        ),
                      ),
                    ),
                  ],
                );
              },),
      )
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
        index: 0,
        onTap: (index) {
          if(index==1){
            Navigator.pushReplacementNamed(context, "/home");
          }
          else if (index==2){
            Navigator.pushReplacementNamed(context, "/info");
          }
          //Handle button tap
        },
        animationDuration: Duration(
          milliseconds: 200,
        ),
        animationCurve: Curves.easeIn,
      ),
      
      ); }
      else{
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: SpinKitDoubleBounce(
              color: Colors.white,
              size: 50,
            ),
          )
        );
      }
}}
// 