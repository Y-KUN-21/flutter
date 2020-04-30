import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDaytime'] ? 'sun.jpg' : 'moon.jpg';
    print(data);
    return Scaffold(
      //backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('$bgImage'),
                fit: BoxFit.cover,
              )
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                     dynamic got_location = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data = {
                         'location':got_location['location'],
                         'url':got_location['url'],
                         'time':got_location['time'],
                         'isDaytime':got_location['isDaytime'],
                       };
                       print(data);
                     });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 25,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                      data['time'],
                      style: TextStyle(
                          fontSize: 66.0,
                          color: Colors.white
                      )
                  ),
                ],
              ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}