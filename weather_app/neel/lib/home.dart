import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neel/api.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static String city = "mumbai";
  String unit = "metric";
  String units = "celsius";
  var getdata = Api();
  String description;
  String icons;
  String temp;
  String feelsLike;
  String tempMin;
  String name;
  String windspeed;
  String country;
  String greet;
  String current;
  String humidity;
  String day;

  void weather() async {
    await getdata.goApi("$city", "$unit");
    setState(() {
      name = getdata.data["name"];
      country = getdata.data["sys"]["country"];
      description = getdata.data["weather"][0]["main"];
      temp = getdata.data["main"]["temp_min"].toString();
      feelsLike = getdata.data["main"]["feels_like"].toString();
      icons = getdata.data["weather"][0]["icon"];
      var speed = getdata.data["wind"]['speed'];
      double wind = (speed * 3.6);
      windspeed = wind.toStringAsFixed(0);
      humidity = getdata.data["main"]["humidity"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    if (getdata.data == null) {
      return Container(
        child: Center(
            child: SpinKitChasingDots(
          color: Colors.redAccent,
          size: 50,
        )),
      );
    } else {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: TextField(
                    textAlign: TextAlign.center,
                    onSubmitted: (String userInput) {
                      setState(() {
                        city = userInput;
                        weather();
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Enter City",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20),
                      child: Text(
                        "Hey,\ngood\n$greet",
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (unit == "metric") {
                              unit = "Fahrenheit";
                              units = "Fahrenheit";
                            } else {
                              unit = "metric";
                              units = "celsius";
                            }
                            weather();
                          });
                        },
                        icon: Image.asset('assets/icons/temp.png'),
                        iconSize: 35,
                        tooltip: "setting",
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                          "$day",
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          "$current",
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          "$name",
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "$country",
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          "$temp",
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0),
                          ),
                        ),
                      ),
                      Text(
                        "$units",
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Feels like $feelsLike",
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "$description",
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/icons/$icons.png",
                          width: 25,
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 150,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset(
                                "assets/icons/50n.png",
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "$windspeed kmp/h",
                              style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset(
                                "assets/icons/humidity.png",
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "$humidity %",
                              style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  void time() {
    var now = new DateTime.now();

    var formatter = new DateFormat('H');
    String formatted = formatter.format(now);
    int hour = int.parse(formatted);

    var currentTime = new DateFormat('Hm');
    current = currentTime.format(now);

    var today = new DateFormat('EEEE');
    day = today.format(now);

    if (hour > 5 && hour < 12) {
      greet = "morning.";
    } else if (hour > 12 && hour < 17) {
      greet = "afternoon.";
    } else if (hour > 17 && hour < 22) {
      greet = "evening.";
    } else {
      greet = "night.";
    }
  }

  @override
  void initState() {
    super.initState();
    weather();
    time();
  }
}
