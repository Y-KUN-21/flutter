import 'package:flutter/material.dart';
import 'package:gocorona/screens/home.dart';
import 'package:gocorona/screens/states.dart';
import 'package:gocorona/widgets/Symtoms.dart';
import 'package:gocorona/widgets/preventions.dart';
import 'package:page_indicator/page_indicator.dart';
//import 'package:page_indicator/page_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoCorona',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.amberAccent,
        primarySwatch: Colors.blue,
      
      ),
      home: PageViewClass(),
    );
  }
}

class PageViewClass extends StatelessWidget {
  final controller = PageController(
    initialPage: 2,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageIndicatorContainer(
        key: key,
        child: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
          Prevention(),
          Symptoms(),
          Homepage(),
          Statewise(),
           ],
        ),
        align: IndicatorAlign.bottom,
        length: 4,
        indicatorSpace: 10.0,
        padding: const EdgeInsets.all(5),
        indicatorColor: Colors.blueGrey[500],
        indicatorSelectorColor: Colors.red,
        shape: IndicatorShape.circle(size:16),
      ),
    );
  }
}

