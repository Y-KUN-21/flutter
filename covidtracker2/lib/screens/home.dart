import 'package:flutter/material.dart';
import 'package:gocorona/models/totals.dart';
import 'package:gocorona/service/apiservice.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

Color bg1 = Color(0xff222831);
  Data _datafromApi;
  bool _isloading = true;

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    ApiServices.getDataFromAPI().then((data) {
      setState(() {
        _datafromApi = data;
        _isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
   if (_isloading) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
    var size = MediaQuery.of(context).size;
    var total = _datafromApi.data.unofficialSummary;
    return CustomScrollView(
      slivers: <Widget>[
       
        SliverAppBar(
          pinned: true,
          expandedHeight: size.height * .15,
          backgroundColor: Colors.blue[200],
          elevation: 0.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "goCorona",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  color: Colors.white60),
            ),
          ),
        ),
        SliverAppBar(
          expandedHeight: size.height * .27,
          backgroundColor: Colors.blue[200],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: <Widget>[
                SafeArea(
                  child: Container(
                    height: 90,
                    child: Center(
                      child: Text(
                        "Together,\nwe can Fight Covid-19.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/gods.png",
                  width: size.width * .99,
                  height: size.height * .50,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        SliverAppBar(
          pinned: true,
          expandedHeight: size.height * .20,
          backgroundColor: Colors.redAccent,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    "assets/total.png",
                    width: 150,
                    height: 150,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Total',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                       total[0].total.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          floating: true,
        ),
        SliverAppBar(
          pinned: true,
          expandedHeight: size.height * .20,
          backgroundColor: Colors.blueAccent,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Active",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                       total[0].active.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/active.png",
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
          floating: true,
        ),
        SliverAppBar(
          pinned: true,
          expandedHeight: size.height * .20,
          backgroundColor: Colors.greenAccent,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    "assets/recoverd.png",
                    width: 150,
                    height: 150,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                       "Recovered",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                      total[0].recovered.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          floating: true,
        ),
        SliverAppBar(
          pinned: true,
          expandedHeight: size.height * .20,
          backgroundColor: Colors.grey,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Deceased",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        total[0].deaths.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/Deceased.png",
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
          floating: true,
        ),
      ],
    );
  }
}
}