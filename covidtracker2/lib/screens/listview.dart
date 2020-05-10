import 'package:flutter/material.dart';
import 'package:gocorona/models/totals.dart';
import 'package:gocorona/service/apiservice.dart';

class Listview extends StatefulWidget {
  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  Data _datafromApi;
  bool _isloading;

  @override
  void initState() {
    super.initState();

    _isloading = true;
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
      return ListView.builder(
          itemCount:
              _datafromApi == null ? 0 : _datafromApi.data.regional.length,
          itemBuilder: (context, int index) {
            var region = _datafromApi.data.regional;
            return Container(
              color: Colors.grey[100],
              height: size.height * .20,
              child: Card(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          region[index].loc.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              letterSpacing: 1.0),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: <Widget>[
                                Text(
                                  "Total",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Image.asset(
                                  "assets/total.png",
                                  width: 50,
                                  height: 55,
                                ),
                                Text(
                                  region[index].totalConfirmed.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "Indian",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Image.asset(
                                  "assets/indian.png",
                                  width: 50,
                                  height: 55,
                                ),
                                Text(
                                  region[index].confirmedCasesIndian.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "Foreign",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Image.asset(
                                  "assets/foreign.png",
                                  width: 50,
                                  height: 55,
                                ),
                                Text(
                                  region[index]
                                      .confirmedCasesForeign
                                      .toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "Recoverd",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Image.asset(
                                  "assets/recoverd.png",
                                  width: 50,
                                  height: 55,
                                ),
                                Text(
                                  region[index].discharged.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "Deceased",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Image.asset(
                                  "assets/Deceased.png",
                                  width: 50,
                                  height: 55,
                                ),
                                Text(
                                  region[index].deaths.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }
}
