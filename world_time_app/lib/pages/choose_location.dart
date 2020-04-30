import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  @override
  void initState() {
    super.initState();
  }

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/kolkata', location: 'Mumbai', flag: 'india.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Australia/sydney', location: 'Australia', flag: 'australia.png'),
  ];

  void updateTime (index) async {
    WorldTime instance = locations[index];
    await instance.getData();

    Navigator.pop(context,{
      'location':instance.location,
      'url':instance.url,
      'time':instance.time,
      'flag':instance.flag,
      'isDaytime':instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text(
          'Choose Location',
          style: TextStyle(
            fontSize: 25.0,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black38,
        elevation: 0.0,
      ),
    body: ListView.builder(itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                child: CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    backgroundImage:AssetImage(locations[index].flag) ,
                    radius: 22,
                  ),
                ),
              ),
            ),
          );
        }
        ),
    );
  }
}
