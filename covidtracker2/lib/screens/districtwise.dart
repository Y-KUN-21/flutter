import 'package:flutter/material.dart';
import 'package:gocorona/models/districtwise.dart';
import 'package:gocorona/service/apidistrictwiseservice.dart';

class DistrictWise extends StatefulWidget {
  @override
  _DistrictWiseState createState() => _DistrictWiseState();
}

class _DistrictWiseState extends State<DistrictWise> {
  List<Districtwise> _districtwise;
  bool _isloading = true;
  String state = "Maharashtra";
  @override
  void initState() {
    super.initState();
    ApiDistrictWiseServices.getDistrictFromAPI().then((districtwise) {
      setState(() {
        _districtwise = districtwise;
        _isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_districtwise[0].state),),
      body: SafeArea(
              child: Container(
          child: ListView.builder(
              itemCount: _districtwise == null ? 0 : 2, //_districtwise.length,
              itemBuilder: (context, int index) {
                var districtData = _districtwise[0].districtData[index];
                return Container(
                  child: Row(
                    children: [
                      Text(districtData.district.toString()),
                      Text(districtData.active.toString()),
                      Text(districtData.confirmed.toString()),
                      Text(districtData.deceased.toString()),
                      Text(districtData.recovered.toString()),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
