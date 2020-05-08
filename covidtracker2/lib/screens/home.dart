import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

Color bg1 = Color(0xff222831);

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,

          expandedHeight: size.height * .25,
          //backgroundColor: bg1,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "COVID-19",
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Schyler',
                  color: Colors.white,
                  letterSpacing: 5.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
          floating: true,
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
                        "Total",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 45,
                            fontFamily: 'Schyler',
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "526541",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'Schyler',
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
                            fontFamily: 'Schyler',
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "36527",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'Schyler',
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
                            fontFamily: 'Schyler',
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "16002",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'Schyler',
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
                            fontFamily: 'Schyler',
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "1834",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'Schyler',
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
